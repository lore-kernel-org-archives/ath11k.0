Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m42-4.mailgun.net ([69.72.42.4])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKM4D-0002R7-W3
 for ath11k@lists.infradead.org; Mon, 21 Sep 2020 13:41:22 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH v3] ath11k: cold boot calibration support
References: <1600163991-2093-1-git-send-email-ssreeela@codeaurora.org>
 <202009160303.xwD2GbBx%lkp@intel.com>
Date: Mon, 21 Sep 2020 16:40:46 +0300
In-Reply-To: <202009160303.xwD2GbBx%lkp@intel.com> (kernel test robot's
 message of "Wed, 16 Sep 2020 03:51:16 +0800")
Message-ID: <87v9g7459d.fsf@codeaurora.org>
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
To: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, Sowmiya Sree Elavalagan <ssreeela@codeaurora.org>, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, Govindaraj Saminathan <gsamin@codeaurora.org>

kernel test robot <lkp@intel.com> writes:

> Thank you for the patch! Yet something to improve:
>
> [auto build test ERROR on ath6kl/ath-next]
> [also build test ERROR on next-20200915]
> [cannot apply to v5.9-rc5]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
>
> url:
> https://github.com/0day-ci/linux/commits/Sowmiya-Sree-Elavalagan/ath11k-cold-boot-calibration-support/20200915-180324
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath-next
> config: mips-allmodconfig (attached as .config)
> compiler: mips-linux-gcc (GCC) 9.3.0
> reproduce (this is a W=1 build):
>         wget
> https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross
> -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=mips 
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>, old ones prefixed by <<):
>
> ERROR: modpost: "fw_arg3" [drivers/mtd/parsers/bcm63xxpart.ko] undefined!
>>> ERROR: modpost: "ath11k_cold_boot_cal"
> [drivers/net/wireless/ath/ath11k/ath11k_ahb.ko] undefined!

For some reason I don't see the kbuild bot report above in patchwork:

https://patchwork.kernel.org/patch/11775953/

This time the message ids seem to be ok:

Message-Id: <1600163991-2093-1-git-send-email-ssreeela@codeaurora.org>
[...]
In-Reply-To: <1600163991-2093-1-git-send-email-ssreeela@codeaurora.org>
References: <1600163991-2093-1-git-send-email-ssreeela@codeaurora.org>

If anyone has ideas why patchwork doesn't see the report, please let me
know.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
