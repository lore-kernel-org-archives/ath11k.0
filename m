Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62C26C021A9
	for <ath11k@archiver.kernel.org>; Mon, 17 Feb 2025 12:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WV/ikV6yQdt/M6rOuJ1M0yJOYc7xi/keflvIqfQhBIo=; b=QbENNUN78msgtMGFhdnfPHzVm3
	Lk8jtcdedPzJswA8HV71OV3Yqmn7gsTUe+Um25Q5vC+EHihWb63r6bPjH1ei+MUlgGIpC5MbEexO4
	rxu0Y/Mh9URqaZKngaCXF+8am6x5n0ep5behRd6+2ff/K7/rD4DolhEqrhn0eT9g9vcvH0jvLzsHQ
	zi9FiXopvnG9zFUKSBEJEkQGAO5U5VEKBoBhAsP05eJM7x/g5r8kennDSPM+myHnNjD4sn8L/GXfk
	tzWCDO1Cs71DZqyTzyfExmZ91qJdy1PqTYRuiklcXm/gMn6/vkkppIjjSxci6RQ7PnKY5GEfaYDMe
	oX6B48Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk0Fx-00000004SFc-00Ef;
	Mon, 17 Feb 2025 12:29:49 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjynf-00000004E4q-3ek4
	for ath11k@lists.infradead.org;
	Mon, 17 Feb 2025 10:56:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739789792; x=1771325792;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hDLOgY+mA75Ymn1iBk9Z4iLCk4JLS5jTuILN+eQ4yqo=;
  b=lTnPBV0IU4esVwvCGq4KRZo+9bXio1nrGTEUv4NX6IZDNQhT5Py21+RG
   YNHAKJbkSQzp5e9xDCehLqnw31RCIOBkLsW1u46nO27yj8S1tK+PjOlNC
   U7qgblQJSDzvL2aOYeZ4A9fbC/nugJGpZ9CsILCBLeceUlFvq3aIc1Bk5
   R/jeAvgo/zZMZZkYNFK7uwOQCGO/kjht2j+9sKxGUF6rsqvhIRahlJs6b
   qdZN9bE5kUhTvp//zPh0rDFQWx2oEVX2il+d9aGOWnhecsDVM6fZat/jW
   nRmM1GDvR/DiW1nbjxA9SIPVQ2vP5qKzC/k3HzDa8nT9AiBrzZhIs6r+9
   g==;
X-CSE-ConnectionGUID: UwDX97v0QSek0hlXtKPRNw==
X-CSE-MsgGUID: mpkMO3GPTui+cEbQ0/LTZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11347"; a="39695326"
X-IronPort-AV: E=Sophos;i="6.13,292,1732608000"; 
   d="scan'208";a="39695326"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2025 02:56:31 -0800
X-CSE-ConnectionGUID: Y7CuIuy7RWWBpOkgyg8jpA==
X-CSE-MsgGUID: aFmpx/LzTN6y0ale2QzYlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="119012041"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 17 Feb 2025 02:56:23 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tjynV-001D0p-0I;
	Mon, 17 Feb 2025 10:56:21 +0000
Date: Mon, 17 Feb 2025 18:55:43 +0800
From: kernel test robot <lkp@intel.com>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
	Bjorn Helgaas <helgaas@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>,
	Johannes Berg <johannes@sipsolutions.net>,
	Jeff Johnson <jjohnson@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev,
	linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
	quic_jjohnson@quicinc.com, quic_pyarlaga@quicinc.com,
	quic_vbadigan@quicinc.com, quic_vpernami@quicinc.com,
	quic_mrana@quicinc.com,
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: Re: [PATCH 6/8] bus: mhi: host: Add support for Bandwidth scale
Message-ID: <202502171823.5VC7a1E6-lkp@intel.com>
References: <20250217-mhi_bw_up-v1-6-9bad1e42bdb1@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250217-mhi_bw_up-v1-6-9bad1e42bdb1@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_025631_922148_5B681393 
X-CRM114-Status: GOOD (  13.75  )
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

Hi Krishna,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 0ad2507d5d93f39619fc42372c347d6006b64319]

url:    https://github.com/intel-lab-lkp/linux/commits/Krishna-Chaitanya-Chundru/PCI-update-current-bus-speed-as-part-of-pci_bus_add_devices/20250217-144050
base:   0ad2507d5d93f39619fc42372c347d6006b64319
patch link:    https://lore.kernel.org/r/20250217-mhi_bw_up-v1-6-9bad1e42bdb1%40oss.qualcomm.com
patch subject: [PATCH 6/8] bus: mhi: host: Add support for Bandwidth scale
config: x86_64-buildonly-randconfig-006-20250217 (https://download.01.org/0day-ci/archive/20250217/202502171823.5VC7a1E6-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250217/202502171823.5VC7a1E6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502171823.5VC7a1E6-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/bus/mhi/host/init.c:682:6: warning: variable 'doorbell' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     682 |         if (mhi_cntrl->get_misc_doorbell)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/bus/mhi/host/init.c:685:6: note: uninitialized use occurs here
     685 |         if (doorbell > 0) {
         |             ^~~~~~~~
   drivers/bus/mhi/host/init.c:682:2: note: remove the 'if' if its condition is always true
     682 |         if (mhi_cntrl->get_misc_doorbell)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     683 |                 doorbell = mhi_cntrl->get_misc_doorbell(mhi_cntrl, MHI_ER_BW_SCALE);
   drivers/bus/mhi/host/init.c:548:22: note: initialize the variable 'doorbell' to silence this warning
     548 |         int i, ret, doorbell;
         |                             ^
         |                              = 0
   1 warning generated.


vim +682 drivers/bus/mhi/host/init.c

   544	
   545	int mhi_init_mmio(struct mhi_controller *mhi_cntrl)
   546	{
   547		u32 val;
   548		int i, ret, doorbell;
   549		struct mhi_chan *mhi_chan;
   550		struct mhi_event *mhi_event;
   551		void __iomem *base = mhi_cntrl->regs;
   552		struct device *dev = &mhi_cntrl->mhi_dev->dev;
   553		struct {
   554			u32 offset;
   555			u32 val;
   556		} reg_info[] = {
   557			{
   558				CCABAP_HIGHER,
   559				upper_32_bits(mhi_cntrl->mhi_ctxt->chan_ctxt_addr),
   560			},
   561			{
   562				CCABAP_LOWER,
   563				lower_32_bits(mhi_cntrl->mhi_ctxt->chan_ctxt_addr),
   564			},
   565			{
   566				ECABAP_HIGHER,
   567				upper_32_bits(mhi_cntrl->mhi_ctxt->er_ctxt_addr),
   568			},
   569			{
   570				ECABAP_LOWER,
   571				lower_32_bits(mhi_cntrl->mhi_ctxt->er_ctxt_addr),
   572			},
   573			{
   574				CRCBAP_HIGHER,
   575				upper_32_bits(mhi_cntrl->mhi_ctxt->cmd_ctxt_addr),
   576			},
   577			{
   578				CRCBAP_LOWER,
   579				lower_32_bits(mhi_cntrl->mhi_ctxt->cmd_ctxt_addr),
   580			},
   581			{
   582				MHICTRLBASE_HIGHER,
   583				upper_32_bits(mhi_cntrl->iova_start),
   584			},
   585			{
   586				MHICTRLBASE_LOWER,
   587				lower_32_bits(mhi_cntrl->iova_start),
   588			},
   589			{
   590				MHIDATABASE_HIGHER,
   591				upper_32_bits(mhi_cntrl->iova_start),
   592			},
   593			{
   594				MHIDATABASE_LOWER,
   595				lower_32_bits(mhi_cntrl->iova_start),
   596			},
   597			{
   598				MHICTRLLIMIT_HIGHER,
   599				upper_32_bits(mhi_cntrl->iova_stop),
   600			},
   601			{
   602				MHICTRLLIMIT_LOWER,
   603				lower_32_bits(mhi_cntrl->iova_stop),
   604			},
   605			{
   606				MHIDATALIMIT_HIGHER,
   607				upper_32_bits(mhi_cntrl->iova_stop),
   608			},
   609			{
   610				MHIDATALIMIT_LOWER,
   611				lower_32_bits(mhi_cntrl->iova_stop),
   612			},
   613			{0, 0}
   614		};
   615	
   616		dev_dbg(dev, "Initializing MHI registers\n");
   617	
   618		/* Read channel db offset */
   619		ret = mhi_get_channel_doorbell_offset(mhi_cntrl, &val);
   620		if (ret)
   621			return ret;
   622	
   623		if (val >= mhi_cntrl->reg_len - (8 * MHI_DEV_WAKE_DB)) {
   624			dev_err(dev, "CHDB offset: 0x%x is out of range: 0x%zx\n",
   625				val, mhi_cntrl->reg_len - (8 * MHI_DEV_WAKE_DB));
   626			return -ERANGE;
   627		}
   628	
   629		/* Setup wake db */
   630		mhi_cntrl->wake_db = base + val + (8 * MHI_DEV_WAKE_DB);
   631		mhi_cntrl->wake_set = false;
   632	
   633		/* Setup channel db address for each channel in tre_ring */
   634		mhi_chan = mhi_cntrl->mhi_chan;
   635		for (i = 0; i < mhi_cntrl->max_chan; i++, val += 8, mhi_chan++)
   636			mhi_chan->tre_ring.db_addr = base + val;
   637	
   638		/* Read event ring db offset */
   639		ret = mhi_read_reg(mhi_cntrl, base, ERDBOFF, &val);
   640		if (ret) {
   641			dev_err(dev, "Unable to read ERDBOFF register\n");
   642			return -EIO;
   643		}
   644	
   645		if (val >= mhi_cntrl->reg_len - (8 * mhi_cntrl->total_ev_rings)) {
   646			dev_err(dev, "ERDB offset: 0x%x is out of range: 0x%zx\n",
   647				val, mhi_cntrl->reg_len - (8 * mhi_cntrl->total_ev_rings));
   648			return -ERANGE;
   649		}
   650	
   651		/* Setup event db address for each ev_ring */
   652		mhi_event = mhi_cntrl->mhi_event;
   653		for (i = 0; i < mhi_cntrl->total_ev_rings; i++, val += 8, mhi_event++) {
   654			if (mhi_event->offload_ev)
   655				continue;
   656	
   657			mhi_event->ring.db_addr = base + val;
   658		}
   659	
   660		/* Setup DB register for primary CMD rings */
   661		mhi_cntrl->mhi_cmd[PRIMARY_CMD_RING].ring.db_addr = base + CRDB_LOWER;
   662	
   663		/* Write to MMIO registers */
   664		for (i = 0; reg_info[i].offset; i++)
   665			mhi_write_reg(mhi_cntrl, base, reg_info[i].offset,
   666				      reg_info[i].val);
   667	
   668		ret = mhi_write_reg_field(mhi_cntrl, base, MHICFG, MHICFG_NER_MASK,
   669					  mhi_cntrl->total_ev_rings);
   670		if (ret) {
   671			dev_err(dev, "Unable to write MHICFG register\n");
   672			return ret;
   673		}
   674	
   675		ret = mhi_write_reg_field(mhi_cntrl, base, MHICFG, MHICFG_NHWER_MASK,
   676					  mhi_cntrl->hw_ev_rings);
   677		if (ret) {
   678			dev_err(dev, "Unable to write MHICFG register\n");
   679			return ret;
   680		}
   681	
 > 682		if (mhi_cntrl->get_misc_doorbell)
   683			doorbell = mhi_cntrl->get_misc_doorbell(mhi_cntrl, MHI_ER_BW_SCALE);
   684	
   685		if (doorbell > 0) {
   686			ret = mhi_init_bw_scale(mhi_cntrl, doorbell);
   687			if (!ret)
   688				mhi_cntrl->bw_scale_db = base + val + (8 * doorbell);
   689			else
   690				dev_warn(dev, "BW scale setup failure\n");
   691		}
   692		return 0;
   693	}
   694	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

