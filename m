Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7573CD3E787
	for <ath11k@archiver.kernel.org>; Thu, 11 Dec 2025 03:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JrFkK5erra3kNWqY8ylnxRh4L32xcv8PH+rAxIvXR0k=; b=PrB8J8iG2UMryvnqfgUM0HI6GG
	2elx2r2+td1DsnmIcx9yCZt4Po2628tZ/S9kAfWJcvK39jEEQ6weDEcyF4fweOlVSjBtwGeuqY5T8
	BVQEklLYL8pagqU3Kvxr8cF1lUW7KKVB7yqI24MYi27M82ZZM/g7Vi/o5Zmh4KRWt1yXoct5mw1kM
	1uJPCjxhIAoDTLCTzln5N9P0S0fAjOOBzfHEgDUn+XwcSf6d6AR5dVmdkAYgu2hUneTl4Q9ImAYmf
	FZqXfCWQdqM8NxZaEVuK0cB0T1BxjvV0hH+qXGSptv/tyzOYhLRDPO1uEDhBqlECgvzGLtfLH9DBD
	7y793ngQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTXCP-0000000G9hk-1d3K;
	Thu, 11 Dec 2025 03:18:37 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTXCM-0000000G9hG-3RU5
	for ath11k@lists.infradead.org;
	Thu, 11 Dec 2025 03:18:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765423115; x=1796959115;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZCJsSyKpFDGI4enSrr3CZY9EUTvp8kqs7B1Bpl9BdAM=;
  b=JgxAh8ACeITqanrjLWnytClVtW3nUSXNSER2SSNwbhtF+6ZrR0M+Swf1
   53KDKgwmT5fnLO9XpP2Q/+csxhouQD0nbgu3n4fSmqtZEzDEgNsIauXTW
   rgxS1Se3CUaFvECat6azHck+m5E4nJyyZ01GKG5Qoy6U+qTGSbgmW5BHz
   mcwZYWZMdV75JqDkdEp17OQ4oP5QOqPoePLj1AEXkJzPuGkrBoro6YH3U
   SKX//W4hoWz/OK5GOfIkXg6pk3JNxSQLJMJuc1cgrg+5tjp6U8YXX1K56
   e5EeJstbX0H2J36Zei8aWQrRzA6n3vSSR3xeqMFGsJXxH9b9u/Ez9qmH+
   Q==;
X-CSE-ConnectionGUID: 3HX6beeEQ+O+1/bIdrgw9Q==
X-CSE-MsgGUID: 7BuhTYuYRNivfuzxVrQ7Mg==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="85008594"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="85008594"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 19:18:32 -0800
X-CSE-ConnectionGUID: dbsS4O/OSVOimLjRfVIMRQ==
X-CSE-MsgGUID: cKn7PKfGT1WYgz/AmLdxnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="220033324"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 10 Dec 2025 19:18:30 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTXCF-00000000461-33tO;
	Thu, 11 Dec 2025 03:18:27 +0000
Date: Thu, 11 Dec 2025 11:17:52 +0800
From: kernel test robot <lkp@intel.com>
To: Alexandru Gagniuc <mr.nuke.me@gmail.com>, ath11k@lists.infradead.org,
	Jeff Johnson <jjohnson@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Alexandru Gagniuc <mr.nuke.me@gmail.com>,
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] wifi: ath11k: move .max_tx_ring to struct
 ath11k_hw_hal_params
Message-ID: <202512111054.OwS5ClW9-lkp@intel.com>
References: <20251210024036.3965135-1-mr.nuke.me@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251210024036.3965135-1-mr.nuke.me@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251210_191834_879260_6EEA8AE0 
X-CRM114-Status: GOOD (  10.67  )
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

Hi Alexandru,

kernel test robot noticed the following build errors:

[auto build test ERROR on ath/ath-next]
[also build test ERROR on linus/master v6.18 next-20251210]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexandru-Gagniuc/wifi-ath11k-move-max_tx_ring-to-struct-ath11k_hw_hal_params/20251210-104321
base:   https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git ath-next
patch link:    https://lore.kernel.org/r/20251210024036.3965135-1-mr.nuke.me%40gmail.com
patch subject: [PATCH] wifi: ath11k: move .max_tx_ring to struct ath11k_hw_hal_params
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20251211/202512111054.OwS5ClW9-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 6ec8c4351cfc1d0627d1633b02ea787bd29c77d8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251211/202512111054.OwS5ClW9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512111054.OwS5ClW9-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/wireless/ath/ath11k/debugfs.c:710:32: error: no member named 'max_tx_ring' in 'struct ath11k_hw_params'
     710 |         for (i = 0; i < ab->hw_params.max_tx_ring; i++)
         |                         ~~~~~~~~~~~~~ ^
   1 error generated.


vim +710 drivers/net/wireless/ath/ath11k/debugfs.c

da3a9d3c15769b Kalle Valo    2020-09-16  657  
cb4e57db2ff0c8 Kalle Valo    2020-09-16  658  static ssize_t ath11k_debugfs_dump_soc_dp_stats(struct file *file,
da3a9d3c15769b Kalle Valo    2020-09-16  659  						char __user *user_buf,
da3a9d3c15769b Kalle Valo    2020-09-16  660  						size_t count, loff_t *ppos)
da3a9d3c15769b Kalle Valo    2020-09-16  661  {
da3a9d3c15769b Kalle Valo    2020-09-16  662  	struct ath11k_base *ab = file->private_data;
da3a9d3c15769b Kalle Valo    2020-09-16  663  	struct ath11k_soc_dp_stats *soc_stats = &ab->soc_stats;
da3a9d3c15769b Kalle Valo    2020-09-16  664  	int len = 0, i, retval;
da3a9d3c15769b Kalle Valo    2020-09-16  665  	const int size = 4096;
da3a9d3c15769b Kalle Valo    2020-09-16  666  	static const char *rxdma_err[HAL_REO_ENTR_RING_RXDMA_ECODE_MAX] = {
da3a9d3c15769b Kalle Valo    2020-09-16  667  			"Overflow", "MPDU len", "FCS", "Decrypt", "TKIP MIC",
da3a9d3c15769b Kalle Valo    2020-09-16  668  			"Unencrypt", "MSDU len", "MSDU limit", "WiFi parse",
da3a9d3c15769b Kalle Valo    2020-09-16  669  			"AMSDU parse", "SA timeout", "DA timeout",
da3a9d3c15769b Kalle Valo    2020-09-16  670  			"Flow timeout", "Flush req"};
da3a9d3c15769b Kalle Valo    2020-09-16  671  	static const char *reo_err[HAL_REO_DEST_RING_ERROR_CODE_MAX] = {
da3a9d3c15769b Kalle Valo    2020-09-16  672  			"Desc addr zero", "Desc inval", "AMPDU in non BA",
da3a9d3c15769b Kalle Valo    2020-09-16  673  			"Non BA dup", "BA dup", "Frame 2k jump", "BAR 2k jump",
da3a9d3c15769b Kalle Valo    2020-09-16  674  			"Frame OOR", "BAR OOR", "No BA session",
da3a9d3c15769b Kalle Valo    2020-09-16  675  			"Frame SN equal SSN", "PN check fail", "2k err",
da3a9d3c15769b Kalle Valo    2020-09-16  676  			"PN err", "Desc blocked"};
da3a9d3c15769b Kalle Valo    2020-09-16  677  
da3a9d3c15769b Kalle Valo    2020-09-16  678  	char *buf;
da3a9d3c15769b Kalle Valo    2020-09-16  679  
da3a9d3c15769b Kalle Valo    2020-09-16  680  	buf = kzalloc(size, GFP_KERNEL);
da3a9d3c15769b Kalle Valo    2020-09-16  681  	if (!buf)
da3a9d3c15769b Kalle Valo    2020-09-16  682  		return -ENOMEM;
da3a9d3c15769b Kalle Valo    2020-09-16  683  
da3a9d3c15769b Kalle Valo    2020-09-16  684  	len += scnprintf(buf + len, size - len, "SOC RX STATS:\n\n");
da3a9d3c15769b Kalle Valo    2020-09-16  685  	len += scnprintf(buf + len, size - len, "err ring pkts: %u\n",
da3a9d3c15769b Kalle Valo    2020-09-16  686  			 soc_stats->err_ring_pkts);
da3a9d3c15769b Kalle Valo    2020-09-16  687  	len += scnprintf(buf + len, size - len, "Invalid RBM: %u\n\n",
da3a9d3c15769b Kalle Valo    2020-09-16  688  			 soc_stats->invalid_rbm);
da3a9d3c15769b Kalle Valo    2020-09-16  689  	len += scnprintf(buf + len, size - len, "RXDMA errors:\n");
da3a9d3c15769b Kalle Valo    2020-09-16  690  	for (i = 0; i < HAL_REO_ENTR_RING_RXDMA_ECODE_MAX; i++)
da3a9d3c15769b Kalle Valo    2020-09-16  691  		len += scnprintf(buf + len, size - len, "%s: %u\n",
da3a9d3c15769b Kalle Valo    2020-09-16  692  				 rxdma_err[i], soc_stats->rxdma_error[i]);
da3a9d3c15769b Kalle Valo    2020-09-16  693  
da3a9d3c15769b Kalle Valo    2020-09-16  694  	len += scnprintf(buf + len, size - len, "\nREO errors:\n");
da3a9d3c15769b Kalle Valo    2020-09-16  695  	for (i = 0; i < HAL_REO_DEST_RING_ERROR_CODE_MAX; i++)
da3a9d3c15769b Kalle Valo    2020-09-16  696  		len += scnprintf(buf + len, size - len, "%s: %u\n",
da3a9d3c15769b Kalle Valo    2020-09-16  697  				 reo_err[i], soc_stats->reo_error[i]);
da3a9d3c15769b Kalle Valo    2020-09-16  698  
da3a9d3c15769b Kalle Valo    2020-09-16  699  	len += scnprintf(buf + len, size - len, "\nHAL REO errors:\n");
da3a9d3c15769b Kalle Valo    2020-09-16  700  	len += scnprintf(buf + len, size - len,
da3a9d3c15769b Kalle Valo    2020-09-16  701  			 "ring0: %u\nring1: %u\nring2: %u\nring3: %u\n",
da3a9d3c15769b Kalle Valo    2020-09-16  702  			 soc_stats->hal_reo_error[0],
da3a9d3c15769b Kalle Valo    2020-09-16  703  			 soc_stats->hal_reo_error[1],
da3a9d3c15769b Kalle Valo    2020-09-16  704  			 soc_stats->hal_reo_error[2],
da3a9d3c15769b Kalle Valo    2020-09-16  705  			 soc_stats->hal_reo_error[3]);
da3a9d3c15769b Kalle Valo    2020-09-16  706  
da3a9d3c15769b Kalle Valo    2020-09-16  707  	len += scnprintf(buf + len, size - len, "\nSOC TX STATS:\n");
da3a9d3c15769b Kalle Valo    2020-09-16  708  	len += scnprintf(buf + len, size - len, "\nTCL Ring Full Failures:\n");
da3a9d3c15769b Kalle Valo    2020-09-16  709  
31582373a4a8e8 Baochen Qiang 2021-10-11 @710  	for (i = 0; i < ab->hw_params.max_tx_ring; i++)
da3a9d3c15769b Kalle Valo    2020-09-16  711  		len += scnprintf(buf + len, size - len, "ring%d: %u\n",
da3a9d3c15769b Kalle Valo    2020-09-16  712  				 i, soc_stats->tx_err.desc_na[i]);
da3a9d3c15769b Kalle Valo    2020-09-16  713  
da3a9d3c15769b Kalle Valo    2020-09-16  714  	len += scnprintf(buf + len, size - len,
da3a9d3c15769b Kalle Valo    2020-09-16  715  			 "\nMisc Transmit Failures: %d\n",
da3a9d3c15769b Kalle Valo    2020-09-16  716  			 atomic_read(&soc_stats->tx_err.misc_fail));
da3a9d3c15769b Kalle Valo    2020-09-16  717  
cb4e57db2ff0c8 Kalle Valo    2020-09-16  718  	len += ath11k_debugfs_dump_soc_ring_bp_stats(ab, buf + len, size - len);
da3a9d3c15769b Kalle Valo    2020-09-16  719  
da3a9d3c15769b Kalle Valo    2020-09-16  720  	if (len > size)
da3a9d3c15769b Kalle Valo    2020-09-16  721  		len = size;
da3a9d3c15769b Kalle Valo    2020-09-16  722  	retval = simple_read_from_buffer(user_buf, count, ppos, buf, len);
da3a9d3c15769b Kalle Valo    2020-09-16  723  	kfree(buf);
da3a9d3c15769b Kalle Valo    2020-09-16  724  
da3a9d3c15769b Kalle Valo    2020-09-16  725  	return retval;
da3a9d3c15769b Kalle Valo    2020-09-16  726  }
da3a9d3c15769b Kalle Valo    2020-09-16  727  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

