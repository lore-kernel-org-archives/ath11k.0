Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from z5.mailgun.us ([104.130.96.5])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjmSR-00065x-Dj
 for ath11k@lists.infradead.org; Mon, 30 Nov 2020 16:55:27 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: ath11k: QCA6390 on Dell XPS 13 and kernel crashes
Date: Mon, 30 Nov 2020 18:55:06 +0200
Message-ID: <87tut6iy39.fsf@codeaurora.org>
MIME-Version: 1.0
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: wi nk <wink@technolu.st>, Thomas Krause <thomaskrause@posteo.de>
Cc: ath11k@lists.infradead.org

Hi Wi and Thomas,

I'll start a new thread about problems on XPS 13. The information is
scattered to different threads and hard to find everything, it's much
easier to have everything in one place. So let's continue the discussion
about the kernel crashes on this thread.

Here's what I have understood so far:

* On Dell XPS 15 there are no issues with QCA6390 and it seems to work
  with 32 MSI vectors.

* On Dell XPS 13 there's a BIOS bug and kernel prints:

[    0.050130] DMAR: [Firmware Bug]: Your BIOS is broken; DMAR reported at address 0!
               BIOS vendor: Dell Inc.; Ver: 1.1.1; Product Version:

* Because of this BIOS bug QCA6390 only gets one MSI vector on Dell XPS
  13. We added a hack to ath11k make it work with only vector and after
  that it's possible to boot the firmware, connect to the AP and use the
  device for a while.

* But the problem now is that the kernel is crashing almost immediately
  and almost every time(?). And these crashes only happen on Dell XPS
  13, all other systems (including Dell XPS 15) seem to work without
  issues.

Is my understanding correct? Did I miss anything?

About the symptoms Wi reports:

----------------------------------------------------------------------
So up until this point, everything is working without issues.
Everything seems to spiral out of control a couple of seconds later
when my system attempts to actually bring up the adapter.  In most of
the crash states I will see this:

[   31.286725] wlp85s0: send auth to ec:08:6b:27:01:ea (try 1/3)
[   31.390187] wlp85s0: send auth to ec:08:6b:27:01:ea (try 2/3)
[   31.391928] wlp85s0: authenticated
[   31.394196] wlp85s0: associate with ec:08:6b:27:01:ea (try 1/3)
[   31.396513] wlp85s0: RX AssocResp from ec:08:6b:27:01:ea
(capab=0x411 status=0 aid=6)
[   31.407730] wlp85s0: associated
[   31.434354] IPv6: ADDRCONF(NETDEV_CHANGE): wlp85s0: link becomes ready

And then either somewhere in that pile of messages, or a second or two
after this my machine will start to stutter as I mentioned before, and
then it either hangs, or I see this message (I'm truncating the
timestamp):

[   35.xxxx ] sched: RT throttling activated

After that moment, the machine is unresponsive.  Sorry I can't seem to
extract this data other than screenshots from my phone at the moment,
you can see the dmesg output from 6 different hangs here:

https://github.com/w1nk/ath11k-debug
----------------------------------------------------------------------

And Thomas Krause reports:

--------------------------------------------------------------------------------
I can confirm this behavior on my configuration. I managed to login
once and select the Wifi and connect to it. It seemed curiously enough
be stable long enough to enter the Wifi passphrase. After the
connection was established, the system hang and on each attempt to
reboot into the graphical system it would freeze at some point
(sometimes even before showing the login screen).
----------------------------------------------------------------------

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
