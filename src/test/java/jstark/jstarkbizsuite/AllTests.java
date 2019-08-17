package jstark.jstarkbizsuite;

import org.junit.runner.RunWith;
import org.junit.runners.Suite;
import org.junit.runners.Suite.SuiteClasses;

import jstark.jstarkbizsuite.example.platform.PlatformActionTest;
import jstark.jstarkbizsuite.example.sample.SampleActionTest;
import jstark.jstarkbizsuite.example.sample.SampleServiceTest;

@RunWith(Suite.class)
@SuiteClasses({ SampleActionTest.class, SampleServiceTest.class, PlatformActionTest.class })
public class AllTests
{

}
