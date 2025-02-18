Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EE8AC021A9
	for <ath11k@archiver.kernel.org>; Tue, 18 Feb 2025 00:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DXGVvQcW08xHFZlIlovWA9CftR3gh0Gy6qHHJDROuus=; b=LdoC30QLGvC29Gi277LARF844c
	1GZYww9VegtTFu5ELIrXuNdWTVOvumt6HEMoXyiNB+OfjYxnvQcvG9fOYMMZztp+Tn9lkixWK9GEN
	kLSqL29kN3v6hRG7wAOadPb2NnD5rxmoXH6YkIyfy8zSMkL6Gq310eu0JT7CfmikF8hHp5J5FdB/+
	xnCtvIAmvPQoSRVHq5N7qyWS2g07hYm/2zvKMTNXW8V0mZooz4KKOBaWepcd8jyBc+CJA0VLzvKaH
	BEtggNthPFUunGY3Fs3kUF5m5Us3Us9gRAxRfy0CC+CTUD/vTk/5cEDEzxYiKvMY8PQwsqFhC0nzx
	8BRqy+ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkBbj-00000006Lff-0f05;
	Tue, 18 Feb 2025 00:37:03 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkBbg-00000006Leh-0AL5
	for ath11k@lists.infradead.org;
	Tue, 18 Feb 2025 00:37:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739839020; x=1771375020;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ny5YdOPUC/jjkTovynaC4bFLGUWHmOsAUX5YovP2erk=;
  b=A0em+xZpIL8XPGPVMLS8v+9KD/CggPn4bdXyE6vIBAdW7DyItLN4OcdZ
   KPh1wmjXOiQp8r5j4QDObM7uJCGNGoqotD7DrOGHoVGqKZKGI7YAnFuBA
   J4jXs0jM7gbwmKuP1fCkPtzCzO4TbCZCMudF0TIa2gvciVZ4fdReB5DNZ
   Jmd2R+2hlbUojWh6IWqF02q1vXvoVVwSv1Gex3iGCSOvIlldgrHbIhx48
   e3fMESx4XQ8sSiPSr/mE7hPTjJSBYQ7xMSepl8dLhbx/crJboz/S8SyKD
   0tdD08IPGQsAyE7g2+I3gInzFV+N7NxeVrm5Kqo97ckcoCPvb5qdLy5sk
   w==;
X-CSE-ConnectionGUID: 8FgXvkQcTbyh1BLfLyMZ1A==
X-CSE-MsgGUID: bw8xc7rsTfeUwmB7ss8cbA==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="57925334"
X-IronPort-AV: E=Sophos;i="6.13,294,1732608000"; 
   d="scan'208";a="57925334"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2025 16:36:59 -0800
X-CSE-ConnectionGUID: eMXxnhFWSZqSzMmcCwBiMQ==
X-CSE-MsgGUID: 8/qY5GQfQM+imgwsKRbQew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,294,1732608000"; 
   d="scan'208";a="114107634"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 17 Feb 2025 16:36:52 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tkBbV-001Dj9-1S;
	Tue, 18 Feb 2025 00:36:49 +0000
Date: Tue, 18 Feb 2025 08:36:34 +0800
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
Subject: Re: [PATCH 4/8] PCI: dwc: qcom: Update ICC & OPP votes based upon
 the requested speed
Message-ID: <202502180859.1y6qqeIk-lkp@intel.com>
References: <20250217-mhi_bw_up-v1-4-9bad1e42bdb1@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250217-mhi_bw_up-v1-4-9bad1e42bdb1@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_163700_126873_C64AB6C1 
X-CRM114-Status: GOOD (  10.88  )
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
patch link:    https://lore.kernel.org/r/20250217-mhi_bw_up-v1-4-9bad1e42bdb1%40oss.qualcomm.com
patch subject: [PATCH 4/8] PCI: dwc: qcom: Update ICC & OPP votes based upon the requested speed
config: powerpc64-randconfig-002-20250218 (https://download.01.org/0day-ci/archive/20250218/202502180859.1y6qqeIk-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250218/202502180859.1y6qqeIk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502180859.1y6qqeIk-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pci/controller/dwc/pcie-qcom.c:1319:7: warning: variable 'ret' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
                   if (!IS_ERR(opp)) {
                       ^~~~~~~~~~~~
   drivers/pci/controller/dwc/pcie-qcom.c:1328:9: note: uninitialized use occurs here
           return ret;
                  ^~~
   drivers/pci/controller/dwc/pcie-qcom.c:1319:3: note: remove the 'if' if its condition is always true
                   if (!IS_ERR(opp)) {
                   ^~~~~~~~~~~~~~~~~~
   drivers/pci/controller/dwc/pcie-qcom.c:1311:13: warning: variable 'ret' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
           } else if (pcie->use_pm_opp) {
                      ^~~~~~~~~~~~~~~~
   drivers/pci/controller/dwc/pcie-qcom.c:1328:9: note: uninitialized use occurs here
           return ret;
                  ^~~
   drivers/pci/controller/dwc/pcie-qcom.c:1311:9: note: remove the 'if' if its condition is always true
           } else if (pcie->use_pm_opp) {
                  ^~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/controller/dwc/pcie-qcom.c:1302:9: note: initialize the variable 'ret' to silence this warning
           int ret, freq_mbps;
                  ^
                   = 0
   2 warnings generated.


vim +1319 drivers/pci/controller/dwc/pcie-qcom.c

  1296	
  1297	static int qcom_pcie_set_icc_opp(struct qcom_pcie *pcie, int speed, int width)
  1298	{
  1299		struct dw_pcie *pci = pcie->pci;
  1300		unsigned long freq_kbps;
  1301		struct dev_pm_opp *opp;
  1302		int ret, freq_mbps;
  1303	
  1304		if (pcie->icc_mem) {
  1305			ret = icc_set_bw(pcie->icc_mem, 0,
  1306					 width * QCOM_PCIE_LINK_SPEED_TO_BW(speed));
  1307			if (ret) {
  1308				dev_err(pci->dev, "Failed to set bandwidth for PCIe-MEM interconnect path: %d\n",
  1309					ret);
  1310			}
  1311		} else if (pcie->use_pm_opp) {
  1312			freq_mbps = pcie_dev_speed_mbps(pcie_link_speed[speed]);
  1313			if (freq_mbps < 0)
  1314				return -EINVAL;
  1315	
  1316			freq_kbps = freq_mbps * KILO;
  1317			opp = dev_pm_opp_find_freq_exact(pci->dev, freq_kbps * width,
  1318							 true);
> 1319			if (!IS_ERR(opp)) {
  1320				ret = dev_pm_opp_set_opp(pci->dev, opp);
  1321				if (ret)
  1322					dev_err(pci->dev, "Failed to set OPP for freq (%lu): %d\n",
  1323						freq_kbps * width, ret);
  1324				dev_pm_opp_put(opp);
  1325			}
  1326		}
  1327	
  1328		return ret;
  1329	}
  1330	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

