Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from a27-186.smtp-out.us-west-2.amazonses.com ([54.240.27.186])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGkSe-000879-82
 for ath11k@lists.infradead.org; Fri, 11 Sep 2020 14:55:37 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: drivers/net/wireless/ath/ath11k/ahb.c:919:15: warning: cast to
 smaller integer type 'enum ath11k_hw_rev' from 'const void
References: <202009110445.WqWCY2F0%lkp@intel.com>
Date: Fri, 11 Sep 2020 14:55:33 +0000
In-Reply-To: <202009110445.WqWCY2F0%lkp@intel.com> (kernel test robot's
 message of "Fri, 11 Sep 2020 04:52:50 +0800")
Message-ID: <010101747daa15f7-938f0a66-fdc2-4f89-aa8d-e1eae80507f5-000000@us-west-2.amazonses.com>
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
Cc: Maharaja Kennadyrajan <mkenna@codeaurora.org>, Govindaraj Saminathan <gsamin@codeaurora.org>, Julia Lawall <julia.lawall@lip6.fr>, kbuild-all@lists.01.org, Bhagavathi Perumal S <bperumal@codeaurora.org>, Ganesh Sesetti <gseset@codeaurora.org>, Anilkumar Kolli <akolli@codeaurora.org>, linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com, John Crispin <john@phrozen.org>, Karthikeyan Periyasamy <periyasa@codeaurora.org>, ath11k@lists.infradead.org

+ ath11k

Hi,

can someone look at the ath11k warnings below and send fixes, please?
Some of them might be already fixed, like the one about enum
scan_priority.

Kalle

kernel test robot <lkp@intel.com> writes:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   7fe10096c1508c7f033d34d0741809f8eecc1ed4
> commit: d5c65159f2895379e11ca13f62feabe93278985d ath11k: driver for
> Qualcomm IEEE 802.11ax devices
> date:   10 months ago
> config: x86_64-randconfig-a015-20200910 (attached as .config)
> compiler: clang version 12.0.0 (https://github.com/llvm/llvm-project
> 0a5dc7effb191eff740e0e7ae7bd8e1f6bdb3ad9)
> reproduce (this is a W=1 build):
>         wget
> https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross
> -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install x86_64 cross compiling tool for clang build
>         # apt-get install binutils-x86-64-linux-gnu
>         git checkout d5c65159f2895379e11ca13f62feabe93278985d
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=x86_64 
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All warnings (new ones prefixed by >>):
>
>>> drivers/net/wireless/ath/ath11k/ahb.c:919:15: warning: cast to
>>> smaller integer type 'enum ath11k_hw_rev' from 'const void *'
>>> [-Wvoid-pointer-to-enum-cast]
>            ab->hw_rev = (enum ath11k_hw_rev)of_id->data;
>                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    1 warning generated.
> --
>>> drivers/net/wireless/ath/ath11k/wmi.c:142:8: warning: format
>>> specifies type 'unsigned char' but the argument has type 'u16' (aka
>>> 'unsigned short') [-Wformat]
>                                       tlv_tag, ptr - begin, len, tlv_len);
>                                       ^~~~~~~
>    drivers/net/wireless/ath/ath11k/wmi.c:142:35: warning: format specifies type 'unsigned char' but the argument has type 'u16' (aka 'unsigned short') [-Wformat]
>                                       tlv_tag, ptr - begin, len, tlv_len);
>                                                                  ^~~~~~~
>    drivers/net/wireless/ath/ath11k/wmi.c:150:8: warning: format specifies type 'unsigned char' but the argument has type 'u16' (aka 'unsigned short') [-Wformat]
>                                       tlv_tag, ptr - begin, tlv_len,
>                                       ^~~~~~~
>    drivers/net/wireless/ath/ath11k/wmi.c:150:30: warning: format specifies type 'unsigned char' but the argument has type 'u16' (aka 'unsigned short') [-Wformat]
>                                       tlv_tag, ptr - begin, tlv_len,
>                                                             ^~~~~~~
>    drivers/net/wireless/ath/ath11k/wmi.c:1812:23: warning: implicit conversion from enumeration type 'enum wmi_scan_priority' to different enumeration type 'enum scan_priority' [-Wenum-conversion]
>            arg->scan_priority = WMI_SCAN_PRIORITY_LOW;
>                               ~ ^~~~~~~~~~~~~~~~~~~~~
>    5 warnings generated.
> --
>>> drivers/net/wireless/ath/ath11k/mac.c:3970:6: warning: format
>>> specifies type 'unsigned short' but the argument has type 'u32'
>>> (aka 'unsigned int') [-Wformat]
>                       ctx->def.chan->center_freq, ctx->def.width, ctx);
>                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
>    drivers/net/wireless/ath/ath11k/debug.h:275:37: note: expanded from macro 'ath11k_dbg'
>                    __ath11k_dbg(ar, dbg_mask, fmt, ##__VA_ARGS__); \
>                                               ~~~    ^~~~~~~~~~~
>    drivers/net/wireless/ath/ath11k/mac.c:3994:6: warning: format specifies type 'unsigned short' but the argument has type 'u32' (aka 'unsigned int') [-Wformat]
>                       ctx->def.chan->center_freq, ctx->def.width, ctx);
>                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
>    drivers/net/wireless/ath/ath11k/debug.h:275:37: note: expanded from macro 'ath11k_dbg'
>                    __ath11k_dbg(ar, dbg_mask, fmt, ##__VA_ARGS__); \
>                                               ~~~    ^~~~~~~~~~~
>    drivers/net/wireless/ath/ath11k/mac.c:4241:7: warning: format specifies type 'unsigned short' but the argument has type 'u32' (aka 'unsigned int') [-Wformat]
>                               vifs[i].old_ctx->def.chan->center_freq,
>                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    drivers/net/wireless/ath/ath11k/debug.h:275:37: note: expanded from macro 'ath11k_dbg'
>                    __ath11k_dbg(ar, dbg_mask, fmt, ##__VA_ARGS__); \
>                                               ~~~    ^~~~~~~~~~~
>    drivers/net/wireless/ath/ath11k/mac.c:4242:7: warning: format specifies type 'unsigned short' but the argument has type 'u32' (aka 'unsigned int') [-Wformat]
>                               vifs[i].new_ctx->def.chan->center_freq,
>                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    drivers/net/wireless/ath/ath11k/debug.h:275:37: note: expanded from macro 'ath11k_dbg'
>                    __ath11k_dbg(ar, dbg_mask, fmt, ##__VA_ARGS__); \
>                                               ~~~    ^~~~~~~~~~~
>    drivers/net/wireless/ath/ath11k/mac.c:4337:6: warning: format specifies type 'unsigned short' but the argument has type 'u32' (aka 'unsigned int') [-Wformat]
>                       ctx->def.chan->center_freq, ctx->def.width, ctx, changed);
>                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
>    drivers/net/wireless/ath/ath11k/debug.h:275:37: note: expanded from macro 'ath11k_dbg'
>                    __ath11k_dbg(ar, dbg_mask, fmt, ##__VA_ARGS__); \
>                                               ~~~    ^~~~~~~~~~~
>>> drivers/net/wireless/ath/ath11k/mac.c:4640:22: warning: format
>>> specifies type 'unsigned char' but the argument has type 'u32' (aka
>>> 'unsigned int') [-Wformat]
>                       arvif->vdev_id, rate, nss, sgi);
>                                       ^~~~
>    drivers/net/wireless/ath/ath11k/debug.h:275:37: note: expanded from macro 'ath11k_dbg'
>                    __ath11k_dbg(ar, dbg_mask, fmt, ##__VA_ARGS__); \
>                                               ~~~    ^~~~~~~~~~~
>    6 warnings generated.
> --
>>> drivers/net/wireless/ath/ath11k/dp_rx.c:977:8: warning: format specifies type 'unsigned char' but the argument has type 'u16' (aka 'unsigned short') [-Wformat]
>                                       tlv_tag, ptr - begin, len, tlv_len);
>                                       ^~~~~~~
>    drivers/net/wireless/ath/ath11k/dp_rx.c:977:35: warning: format specifies type 'unsigned char' but the argument has type 'u16' (aka 'unsigned short') [-Wformat]
>                                       tlv_tag, ptr - begin, len, tlv_len);
>                                                                  ^~~~~~~
>    2 warnings generated.
>
> # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=d5c65159f2895379e11ca13f62feabe93278985d
> git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
> git fetch --no-tags linus master
> git checkout d5c65159f2895379e11ca13f62feabe93278985d
> vim +919 drivers/net/wireless/ath/ath11k/ahb.c
>
>    879	
>    880	static int ath11k_ahb_probe(struct platform_device *pdev)
>    881	{
>    882		struct ath11k_base *ab;
>    883		const struct of_device_id *of_id;
>    884		struct resource *mem_res;
>    885		void __iomem *mem;
>    886		int ret;
>    887	
>    888		of_id = of_match_device(ath11k_ahb_of_match, &pdev->dev);
>    889		if (!of_id) {
>    890			dev_err(&pdev->dev, "failed to find matching device tree id\n");
>    891			return -EINVAL;
>    892		}
>    893	
>    894		mem_res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>    895		if (!mem_res) {
>    896			dev_err(&pdev->dev, "failed to get IO memory resource\n");
>    897			return -ENXIO;
>    898		}
>    899	
>    900		mem = devm_ioremap_resource(&pdev->dev, mem_res);
>    901		if (IS_ERR(mem)) {
>    902			dev_err(&pdev->dev, "ioremap error\n");
>    903			return PTR_ERR(mem);
>    904		}
>    905	
>    906		ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
>    907		if (ret) {
>    908			dev_err(&pdev->dev, "failed to set 32-bit consistent dma\n");
>    909			return ret;
>    910		}
>    911	
>    912		ab = ath11k_core_alloc(&pdev->dev);
>    913		if (!ab) {
>    914			dev_err(&pdev->dev, "failed to allocate ath11k base\n");
>    915			return -ENOMEM;
>    916		}
>    917	
>    918		ab->pdev = pdev;
>  > 919		ab->hw_rev = (enum ath11k_hw_rev)of_id->data;
>    920		ab->mem = mem;
>    921		ab->mem_len = resource_size(mem_res);
>    922		platform_set_drvdata(pdev, ab);
>    923	
>    924		ret = ath11k_hal_srng_init(ab);
>    925		if (ret)
>    926			goto err_core_free;
>    927	
>    928		ret = ath11k_ce_alloc_pipes(ab);
>    929		if (ret) {
>    930			ath11k_err(ab, "failed to allocate ce pipes: %d\n", ret);
>    931			goto err_hal_srng_deinit;
>    932		}
>    933	
>    934		ath11k_ahb_init_qmi_ce_config(ab);
>    935	
>    936		ret = ath11k_ahb_config_irq(ab);
>    937		if (ret) {
>    938			ath11k_err(ab, "failed to configure irq: %d\n", ret);
>    939			goto err_ce_free;
>    940		}
>    941	
>    942		ret = ath11k_core_init(ab);
>    943		if (ret) {
>    944			ath11k_err(ab, "failed to init core: %d\n", ret);
>    945			goto err_ce_free;
>    946		}
>    947	
>    948		return 0;
>    949	
>    950	err_ce_free:
>    951		ath11k_ce_free_pipes(ab);
>    952	
>    953	err_hal_srng_deinit:
>    954		ath11k_hal_srng_deinit(ab);
>    955	
>    956	err_core_free:
>    957		ath11k_core_free(ab);
>    958		platform_set_drvdata(pdev, NULL);
>    959	
>    960		return ret;
>    961	}
>    962	
>
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
>

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
