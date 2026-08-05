Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DA73C55ABA
	for <ath11k@archiver.kernel.org>; Wed,  5 Aug 2026 18:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KMu1fWmmkzeeijtpoZ7XP1P+WcjbSBuYQnsuCjzaz/s=; b=pfBl01LU7VyQ1LR4UB9CEPxf/O
	0gtTkYrxDfLYwjWWwebXrXZvHhSnBPbk3Hk+vTxrYLS8nWFtFxx8VtmItzfqKsTK5S0XYaFHsVL4s
	xkc06tVPsMxMN/JuPSrUpydniHE3Vhm+25dxELuV4UjiRrnHG/hMle7+FshvC2cErRYC0eGW5obRo
	6S3dQnEkTHVBNzW9qrULXjVPN9k3Xy6XQ+qSeBynfP0zLGYVTUZaNmhEuEDKJ5xRZYCCZP/iZgeL8
	gNJyzOjpLKJ1YQqxYFS8yczLpRSX3YpPDsKlFp2v+xjET/Y5trkUy59Qjk3SA/3XGL5mBu+yLBPEY
	9R4YPoKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrgNX-00000004OIV-2Tgo;
	Wed, 05 Aug 2026 18:30:11 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrgNU-00000004OHy-39OM
	for ath11k@lists.infradead.org;
	Wed, 05 Aug 2026 18:30:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785954609; x=1817490609;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=utpojKUF95bDzNpLPJbA4psKaKMENREP0Alb7ABUwnI=;
  b=bgOJbB2qUmMBWlKsXNxjySDw5I6NpRzYid/Uo1IUdMYg6dgqLvKKvaGc
   cZQXk2fB+Ngq/lfnZqb49jTAF7kpLIKQiaVyrS3eklF6v14KsYkehOcp4
   L7wx6aQPcVRjGdtwD1XBWESaNE6zaYWUWcdReNBrPcTu1MVpPER6466nd
   lvnmVkqmrLnD7zp6V6AKmf06etGuWXcXr9ENCYLpdQ+m6YdfCCONo5wbd
   x1zyuUqX+W8jrz6HatG52Hr6D9b3btrFSWTyg612PgzSfMUo1NuGhbmBT
   yUJJkoLob99M2Uw1hSvRoW9YQU7+DqsOiEXXVg/8O8cVbiFYq+WMO35G2
   Q==;
X-CSE-ConnectionGUID: oYDFumYpQ96bW3rdWshnnw==
X-CSE-MsgGUID: pqLJhimwRmeVEaUT7CBc6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11866"; a="112089721"
X-IronPort-AV: E=Sophos;i="6.25,206,1779174000"; 
   d="scan'208";a="112089721"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2026 11:30:08 -0700
X-CSE-ConnectionGUID: rxYqsTZyQH+2+1TvvY6WlA==
X-CSE-MsgGUID: Y+uGcJtJSBGHjQh78HC5kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,206,1779174000"; 
   d="scan'208";a="285243294"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 05 Aug 2026 11:30:02 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wrgNM-00000000DCD-06rL;
	Wed, 05 Aug 2026 18:30:00 +0000
Date: Thu, 6 Aug 2026 02:29:16 +0800
From: kernel test robot <lkp@intel.com>
To: ZhaoJinming <zhaojinming@uniontech.com>,
	Jeff Johnson <jjohnson@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org, linux-kernel@vger.kernel.org,
	ZhaoJinming <zhaojinming@uniontech.com>
Subject: Re: [PATCH] wifi: ath11k: fix resource leak on error in ext IRQ setup
Message-ID: <202608060243.Pcqzgk1V-lkp@intel.com>
References: <20260622025659.1235658-1-zhaojinming@uniontech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260622025659.1235658-1-zhaojinming@uniontech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_113008_844465_212E6A51 
X-CRM114-Status: GOOD (  16.03  )
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Hi ZhaoJinming,

kernel test robot noticed the following build errors:

[auto build test ERROR on wireless/main]
[also build test ERROR on wireless-next/main linus/master v7.2-rc6]
[cannot apply to ath/ath-next next-20260805]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/ZhaoJinming/wifi-ath11k-fix-resource-leak-on-error-in-ext-IRQ-setup/20260805-214821
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless.git main
patch link:    https://lore.kernel.org/r/20260622025659.1235658-1-zhaojinming%40uniontech.com
patch subject: [PATCH] wifi: ath11k: fix resource leak on error in ext IRQ setup
config: alpha-allmodconfig (https://download.01.org/0day-ci/archive/20260806/202608060243.Pcqzgk1V-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260806/202608060243.Pcqzgk1V-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608060243.Pcqzgk1V-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/wireless/ath/ath11k/ahb.c: In function 'ath11k_ahb_config_ext_irq':
>> drivers/net/wireless/ath/ath11k/ahb.c:615:17: error: 'irq_grp' undeclared (first use in this function)
     615 |                 irq_grp = &ab->ext_irq_grp[i];
         |                 ^~~~~~~
   drivers/net/wireless/ath/ath11k/ahb.c:615:17: note: each undeclared identifier is reported only once for each function it appears in


vim +/irq_grp +615 drivers/net/wireless/ath/ath11k/ahb.c

   523	
   524	static int ath11k_ahb_config_ext_irq(struct ath11k_base *ab)
   525	{
   526		struct ath11k_hw_params *hw = &ab->hw_params;
   527		int i, j;
   528		int irq;
   529		int ret;
   530	
   531		for (i = 0; i < ATH11K_EXT_IRQ_GRP_NUM_MAX; i++) {
   532			struct ath11k_ext_irq_grp *irq_grp = &ab->ext_irq_grp[i];
   533			u32 num_irq = 0;
   534	
   535			irq_grp->ab = ab;
   536			irq_grp->grp_id = i;
   537	
   538			irq_grp->napi_ndev = alloc_netdev_dummy(0);
   539			if (!irq_grp->napi_ndev) {
   540				irq_grp->num_irq = 0;
   541				goto err_request_irq;
   542			}
   543	
   544			netif_napi_add(irq_grp->napi_ndev, &irq_grp->napi,
   545				       ath11k_ahb_ext_grp_napi_poll);
   546	
   547			for (j = 0; j < ATH11K_EXT_IRQ_NUM_MAX; j++) {
   548				if (ab->hw_params.ring_mask->tx[i] & BIT(j)) {
   549					irq_grp->irqs[num_irq++] =
   550						wbm2host_tx_completions_ring1 - j;
   551				}
   552	
   553				if (ab->hw_params.ring_mask->rx[i] & BIT(j)) {
   554					irq_grp->irqs[num_irq++] =
   555						reo2host_destination_ring1 - j;
   556				}
   557	
   558				if (ab->hw_params.ring_mask->rx_err[i] & BIT(j))
   559					irq_grp->irqs[num_irq++] = reo2host_exception;
   560	
   561				if (ab->hw_params.ring_mask->rx_wbm_rel[i] & BIT(j))
   562					irq_grp->irqs[num_irq++] = wbm2host_rx_release;
   563	
   564				if (ab->hw_params.ring_mask->reo_status[i] & BIT(j))
   565					irq_grp->irqs[num_irq++] = reo2host_status;
   566	
   567				if (j < ab->hw_params.max_radios) {
   568					if (ab->hw_params.ring_mask->rxdma2host[i] & BIT(j)) {
   569						irq_grp->irqs[num_irq++] =
   570							rxdma2host_destination_ring_mac1 -
   571							ath11k_hw_get_mac_from_pdev_id(hw, j);
   572					}
   573	
   574					if (ab->hw_params.ring_mask->host2rxdma[i] & BIT(j)) {
   575						irq_grp->irqs[num_irq++] =
   576							host2rxdma_host_buf_ring_mac1 -
   577							ath11k_hw_get_mac_from_pdev_id(hw, j);
   578					}
   579	
   580					if (ab->hw_params.ring_mask->rx_mon_status[i] & BIT(j)) {
   581						irq_grp->irqs[num_irq++] =
   582							ppdu_end_interrupts_mac1 -
   583							ath11k_hw_get_mac_from_pdev_id(hw, j);
   584						irq_grp->irqs[num_irq++] =
   585							rxdma2host_monitor_status_ring_mac1 -
   586							ath11k_hw_get_mac_from_pdev_id(hw, j);
   587					}
   588				}
   589			}
   590			irq_grp->num_irq = num_irq;
   591	
   592			for (j = 0; j < irq_grp->num_irq; j++) {
   593				int irq_idx = irq_grp->irqs[j];
   594	
   595				irq = platform_get_irq_byname(ab->pdev,
   596							      irq_name[irq_idx]);
   597				ab->irq_num[irq_idx] = irq;
   598				irq_set_status_flags(irq, IRQ_NOAUTOEN | IRQ_DISABLE_UNLAZY);
   599				ret = request_irq(irq, ath11k_ahb_ext_interrupt_handler,
   600						  IRQF_TRIGGER_RISING,
   601						  irq_name[irq_idx], irq_grp);
   602				if (ret) {
   603					ath11k_err(ab, "failed request_irq for %d\n",
   604						   irq);
   605					irq_grp->num_irq = j;
   606					goto err_request_irq;
   607				}
   608			}
   609		}
   610	
   611		return 0;
   612	
   613	err_request_irq:
   614		for ( ; i >= 0; i--) {
 > 615			irq_grp = &ab->ext_irq_grp[i];
   616			for (j = irq_grp->num_irq - 1; j >= 0; j--)
   617				free_irq(ab->irq_num[irq_grp->irqs[j]], irq_grp);
   618			if (irq_grp->napi_ndev) {
   619				netif_napi_del(&irq_grp->napi);
   620				free_netdev(irq_grp->napi_ndev);
   621			}
   622		}
   623		return ret;
   624	}
   625	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

