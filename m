Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from z5.mailgun.us ([104.130.96.5])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kMnlP-0007Tj-Sh
 for ath11k@lists.infradead.org; Mon, 28 Sep 2020 07:40:01 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [linux-next:master 9378/11173] ld.lld: error: undefined symbol:
 ath11k_debugfs_htt_ext_stats_handler
References: <202009280207.7DOSq33F%lkp@intel.com>
Date: Mon, 28 Sep 2020 10:39:51 +0300
In-Reply-To: <202009280207.7DOSq33F%lkp@intel.com> (kernel test robot's
 message of "Mon, 28 Sep 2020 02:47:11 +0800")
Message-ID: <87imbyfiyg.fsf@codeaurora.org>
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
Cc: clang-built-linux@googlegroups.com, kbuild-all@lists.01.org, ath11k@lists.infradead.org

+ ath11k

kernel test robot <lkp@intel.com> writes:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   20dc779fdefc40bf7dd9736cea01704f29228fae
> commit: 568f06036ee23a003542227975f69a75ac172ba2 [9378/11173] ath11k:
> debugfs: move some function declarations to correct header files
> config: x86_64-randconfig-a003-20200927 (attached as .config)
> compiler: clang version 12.0.0 (https://github.com/llvm/llvm-project
> 6d374cf78c8a80a0bbfc7ce9bc80b3f183f44c80)
> reproduce (this is a W=1 build):
>         wget
> https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross
> -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install x86_64 cross compiling tool for clang build
>         # apt-get install binutils-x86-64-linux-gnu
>         #
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=568f06036ee23a003542227975f69a75ac172ba2
>         git remote add linux-next
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>         git fetch --no-tags linux-next master
>         git checkout 568f06036ee23a003542227975f69a75ac172ba2
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=x86_64 
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
>>> ld.lld: error: undefined symbol: ath11k_debugfs_htt_ext_stats_handler
>    >>> referenced by dp_rx.c:1662 (drivers/net/wireless/ath/ath11k/dp_rx.c:1662)
>    >>> net/wireless/ath/ath11k/dp_rx.o:(ath11k_dp_htt_htc_t2h_msg_handler)
>    >>> in archive drivers/built-in.a

This should be fixed by:

bc8befe6f950 ath11k: fix undefined reference to 'ath11k_debugfs_htt_ext_stats_handler'

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
