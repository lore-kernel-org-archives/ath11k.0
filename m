Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from z5.mailgun.us ([104.130.96.5])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaLj3-0004eG-O0
 for ath11k@lists.infradead.org; Wed, 04 Nov 2020 16:33:35 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: ath11k: QCA6390 support on Linux
References: <87r1r4nukq.fsf@codeaurora.org>
Date: Wed, 04 Nov 2020 18:33:28 +0200
In-Reply-To: <87r1r4nukq.fsf@codeaurora.org> (Kalle Valo's message of "Mon, 14
 Sep 2020 20:20:53 +0300")
Message-ID: <87mtzxqdyf.fsf@codeaurora.org>
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
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org

Kalle Valo <kvalo@codeaurora.org> writes:

> some of the Dell XPS 15 9500 models have QCA6390 Wi-Fi 6 device. ath11k
> will be the driver to support QCA6390 and the plan is that Linux v5.10
> (most likely released end of December) will be the first release to
> support it.
>
> But as everything is not ready yet I recommend people to test
> ath11k-qca6390-bringup branch, and specifically tag
> ath11k-qca6390-bringup-202008181507. Below are instructions how to
> install kernel and firmware.
>
> Do note that this is still experimental, there will be bugs but at least
> it should be possible to connect to an AP and have connectivity.
>
> Please send all questions, comments and bug reports to
> ath11k@lists.infradead.org list. I do not have time to reply to private
> email. I have Bcced people who have contacted me privately.

Some updates:

* QCA6390 support is now in v5.10-rc2

* pull request to linux-firmware sent, not yet pulled

* board-2.bin should be now used instead of board.bin

* there was some reorganisation in ath11k-firmware

Here are updated instructions on how to test ath11k:

# clone kernel
git clone -b v5.10-rc2 git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git

# clone firmware
git clone https://github.com/kvalo/ath11k-firmware.git

# Ensure below options are selected in the kernel
cd linux
make menuconfig
--> Select Device drivers
	--> Network device support
		--> Wireless LAN
			--> Enable as below
				<M> Qualcomm Technologies 11ax chipset support
				<M>       Atheros ath11k PCI support
				[*]       QCA ath11k debugging
				[*]       QCA ath11k debugfs support
				[*]       ath11k tracing support
				[*]     QCA ath11k spectral scan support

# Build and install the kernel and kernel modules

# Install firmware
cd ../ath11k-firmware
sudo mkdir -p /lib/firmware/ath11k/QCA6390/hw2.0/
sudo cp QCA6390/hw2.0/1.0.1/WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1/*.bin /lib/firmware/ath11k/QCA6390/hw2.0/
sudo cp QCA6390/hw2.0/board-2.bin /lib/firmware/ath11k/QCA6390/hw2.0/

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
