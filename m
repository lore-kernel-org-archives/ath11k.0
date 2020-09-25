Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from z5.mailgun.us ([104.130.96.5])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLhBv-0006D7-6t
 for ath11k@lists.infradead.org; Fri, 25 Sep 2020 06:26:48 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [ath6kl:pending 39/50]
 drivers/net/wireless/ath/ath11k/dp_rx.c:1662: undefined reference to
 `ath11k_debugfs_htt_ext_stats_handler'
References: <202009250110.4gV7v5O3%lkp@intel.com>
Date: Fri, 25 Sep 2020 09:26:39 +0300
In-Reply-To: <202009250110.4gV7v5O3%lkp@intel.com> (kernel test robot's
 message of "Fri, 25 Sep 2020 01:15:14 +0800")
Message-ID: <875z82jrs0.fsf@codeaurora.org>
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
Cc: kbuild-all@lists.01.org, ath11k@lists.infradead.org

(moving to ath11k list)

kernel test robot <lkp@intel.com> writes:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git pending
> head:   55dc2060f5674874a6c37b680bf6396629e05f99
> commit: 568f06036ee23a003542227975f69a75ac172ba2 [39/50] ath11k: debugfs: move some function declarations to correct header files
> config: nios2-randconfig-r026-20200923 (attached as .config)
> compiler: nios2-linux-gcc (GCC) 9.3.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         git checkout 568f06036ee23a003542227975f69a75ac172ba2
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=nios2 
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
>    nios2-linux-ld: drivers/net/wireless/ath/ath11k/dp_rx.o: in function `ath11k_dp_htt_htc_t2h_msg_handler':
>>> drivers/net/wireless/ath/ath11k/dp_rx.c:1662: undefined reference
>> to `ath11k_debugfs_htt_ext_stats_handler'

This happens when CONFIG_ATH11K_DEBUGFS is disabled. I'll send a fix.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
