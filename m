Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hMD57-00009M-Gx
 for ath11k@lists.infradead.org; Thu, 02 May 2019 14:53:07 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH] ath11k: move per peer pktlog entry to per sta debugfs
References: <1555389673-19625-1-git-send-email-akolli@codeaurora.org>
 <3753b87a425d38b5c50c33cb4c030451@codeaurora.org>
 <b7fb612b6fe0c9130d8a60c87fd93f90@codeaurora.org>
 <25124618.P5zsotkJkX@bentobox>
Date: Thu, 02 May 2019 17:53:01 +0300
In-Reply-To: <25124618.P5zsotkJkX@bentobox> (Sven Eckelmann's message of "Wed, 
 24 Apr 2019 11:48:29 +0200")
Message-ID: <87pnp0lxgy.fsf@kamboji.qca.qualcomm.com>
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
To: Sven Eckelmann <sven@narfation.org>
Cc: ath11k@lists.infradead.org

Sven Eckelmann <sven@narfation.org> writes:

> On Wednesday, 24 April 2019 11:04:19 CEST Anilkumar Kolli wrote:
> [...]
>> >> Does not compile:
>> >> 
>> >> drivers/net/wireless/ath/ath11k/debugfs_sta.c:455:11: error:
>> >> initialization of 'ssize_t (*)(struct file *, const char *, size_t,
>> >> loff_t *)' {aka 'long int (*)(struct file *, const char *, long
>> >> unsigned int,  long long int *)'} from incompatible pointer type
>> >> 'ssize_t (*)(struct file *, char *, size_t,  loff_t *)' {aka 'long int
>> >> (*)(struct file *, char *, long unsigned int,  long long int *)'}
>> >> [-Werror=incompatible-pointer-types]
>> >>   .write = ath11k_dbg_sta_write_peer_pktlog,
>> >>            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> > 
>> > I am using "arch/x86/configs/x86_64_defconfig" and ath11k enabled,
>> > could not reproduce this issue.
>> > Kindly share the build instructions.
>
> Not sure what kernel you compile against but the second argument (ubuf) is a 
> const since a long time (before the history of the git repo starts). I can not 
> tell you since when GCC checks the constness for function pointers. But try to 
> upgrade to something recent like GCC 8.
>
>> My build machine configs,
>> ./ath10k-check --version
>> ath10k-check (md5sum 5d3d5f426267bdc0a18e038d2f691a74)
>> 
>> gcc:            gcc (Ubuntu 4.8.4-2ubuntu1~14.04.4) 4.8.4
>> sparse:         0.4.5-rc1
>> checkpatch.pl:  Version: 0.32 (md5sum 3a4f482bde0f92cd08f79fca7efd2a71)
>> gtags:          gtags - GNU GLOBAL 5.7.1
>
> Btw. you should really think about not using such old components. Ever though 
> about upgrading your system from a nearly EOL [1] ubuntu version from 2014 to 
> something more recent?

Yeah, you really should upgrade your ancient distro. But for the kernel
compilation I use crosstool as it's so easy to upgrade the kernel and
not mess with distro's compiler:

https://www.kernel.org/pub/tools/crosstool/

Here's an example to install GCC 8.1 from crosstool:

wget https://www.kernel.org/pub/tools/crosstool/files/bin/x86_64/8.1.0/x86_64-gcc-8.1.0-nolibc-x86_64-linux.tar.xz
cd /opt/cross/
tar -xf ~/tmp/crosstool/x86_64-gcc-8.1.0-nolibc-x86_64-linux.tar.xz

And then just create GNUMakefile to the kernel's top level directory:

CROSS_COMPILE=/opt/cross/gcc-8.1.0-nolibc/x86_64-linux/bin/x86_64-linux-
include Makefile

Now you can just run 'make' and the linux build system will use the new
compiler.

-- 
Kalle Valo

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
