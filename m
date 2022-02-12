Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6F4FC433EF
	for <ath11k@archiver.kernel.org>; Sat, 12 Feb 2022 18:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=41fiUBZgtKoE/zfRVM4YPKn5kQ8Oj0kayhcfU8p91A0=; b=3x9ru3dubyDOpt
	2CnmcYe+31W+oxzR7N5uwvkRNcmgSYTmzsNbVEWnmfdU6uX+9BhE2FkY8GMHtLGWeBB7T1FbHn0pE
	y2JrntAbfa/RB3fmp63Ie29hfCP26G8tBfbhEJCne676UyYh4JaXviiyxEb9aF33v+PvrEei5HXAI
	Jfg7Ud/Ppo3toWn6k0o2S/C7cwkGb+PljODKNFHMDsj26C/GctAR1nSUuUDd9BPZQOgHHFD+Q8fuv
	dgbLy6xYmB9Ou6j22WRoz/lPd+ePGAzLFvqNo2RdqESE1DfD+TQWHDiwd8YFDF4lCTxkcRaQCI6SX
	4TNtUiz9qS8KdAo/PLIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nIwyQ-00AJPn-7A; Sat, 12 Feb 2022 18:18:18 +0000
Received: from mga17.intel.com ([192.55.52.151])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nIwyM-00AJP6-Mc
 for ath11k@lists.infradead.org; Sat, 12 Feb 2022 18:18:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644689894; x=1676225894;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=oAbkx48AifVA1ZnnX3RL43UQ+rIj32/RL2V/hYG14FE=;
 b=IUcypivJjV8Ft+XDcSdJIQq1HA3AFtX6HzbZcseCgVqKFcv81dWgPRdW
 RDiOmDmid7EGsc5ZApfHkJTLT9qAHLJw8nfLKsRlhdi7RUFFLzFF0th03
 N4ouOh+Hswz2uIH/a4SVdJ7lIJxTo4AYERlEBEF/6JXcVghs2SGXE7tfe
 eJuomw6J0wnYKi61KE0ZM+K8CbB59ojTzT+lg/NXCsjhOgBheagImUTBi
 lz7hLbsvIfT9a3IOb1V4754awN0bDWEDfuqaRGJx+R1ltDd2k2PHGcHvX
 daJZeN9qGpzPATDAKbORViC0AHKS1KPwYauwdF8GiwdXUfKvg247phQ7T Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10256"; a="230536036"
X-IronPort-AV: E=Sophos;i="5.88,364,1635231600"; d="scan'208";a="230536036"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2022 10:18:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,364,1635231600"; d="scan'208";a="623510180"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
 by FMSMGA003.fm.intel.com with ESMTP; 12 Feb 2022 10:18:10 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nIwyI-0006UY-2J; Sat, 12 Feb 2022 18:18:10 +0000
Date: Sun, 13 Feb 2022 02:17:37 +0800
From: kernel test robot <lkp@intel.com>
To: Venkateswara Naralasetty <quic_vnaralas@quicinc.com>,
 ath11k@lists.infradead.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
 linux-wireless@vger.kernel.org,
 Venkateswara Naralasetty <quic_vnaralas@quicinc.com>
Subject: Re: [PATCH 5/6] ath11k: Register DBR event handler for CFR data
Message-ID: <202202130103.qvrDOuTL-lkp@intel.com>
References: <1644592075-27082-6-git-send-email-quic_vnaralas@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1644592075-27082-6-git-send-email-quic_vnaralas@quicinc.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220212_101814_775682_278CB2B1 
X-CRM114-Status: GOOD (  13.64  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Hi Venkateswara,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on kvalo-ath/ath-next]
[cannot apply to wireless-next/main wireless/main jberg-mac80211-next/master jberg-mac80211/master v5.17-rc3 next-20220211]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Venkateswara-Naralasetty/ath11k-add-single-shot-periodic-CFR-capture-support-for-IPQ8074/20220211-230911
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath-next
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20220213/202202130103.qvrDOuTL-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project f6685f774697c85d6a352dcea013f46a99f9fe31)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/14cd77b4e3109da2eb6b33501640153852c5d2a7
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Venkateswara-Naralasetty/ath11k-add-single-shot-periodic-CFR-capture-support-for-IPQ8074/20220211-230911
        git checkout 14cd77b4e3109da2eb6b33501640153852c5d2a7
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/net/wireless/ath/ath11k/ drivers/platform/x86/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/net/wireless/ath/ath11k/cfr.c:40:2: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
           case ATH11K_CFR_PREAMBLE_TYPE_HT:
           ^
   drivers/net/wireless/ath/ath11k/cfr.c:40:2: note: insert '__attribute__((fallthrough));' to silence this warning
           case ATH11K_CFR_PREAMBLE_TYPE_HT:
           ^
           __attribute__((fallthrough)); 
   drivers/net/wireless/ath/ath11k/cfr.c:40:2: note: insert 'break;' to avoid fall-through
           case ATH11K_CFR_PREAMBLE_TYPE_HT:
           ^
           break; 
   drivers/net/wireless/ath/ath11k/cfr.c:515:6: warning: no previous prototype for function 'ath11k_cfr_ring_free' [-Wmissing-prototypes]
   void ath11k_cfr_ring_free(struct ath11k *ar)
        ^
   drivers/net/wireless/ath/ath11k/cfr.c:515:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void ath11k_cfr_ring_free(struct ath11k *ar)
   ^
   static 
   2 warnings generated.


vim +40 drivers/net/wireless/ath/ath11k/cfr.c

    18	
    19	static int cfr_calculate_tones_from_dma_hdr(struct ath11k_cfir_dma_hdr *hdr)
    20	{
    21		u8 bw = FIELD_GET(CFIR_DMA_HDR_INFO1_UPLOAD_PKT_BW, hdr->info1);
    22		u8 preamble = FIELD_GET(CFIR_DMA_HDR_INFO1_PREAMBLE_TYPE, hdr->info1);
    23	
    24		switch (preamble) {
    25		case ATH11K_CFR_PREAMBLE_TYPE_LEGACY:
    26		case ATH11K_CFR_PREAMBLE_TYPE_VHT:
    27			switch (bw) {
    28			case 0:
    29				return TONES_IN_20MHZ;
    30			case 1: /* DUP40/VHT40 */
    31				return TONES_IN_40MHZ;
    32			case 2: /* DUP80/VHT80 */
    33				return TONES_IN_80MHZ;
    34			case 3: /* DUP160/VHT160 */
    35				return TONES_IN_160MHZ;
    36			default:
    37				break;
    38			}
    39	
  > 40		case ATH11K_CFR_PREAMBLE_TYPE_HT:
    41			switch (bw) {
    42			case 0:
    43				return TONES_IN_20MHZ;
    44			case 1:
    45				return TONES_IN_40MHZ;
    46			}
    47		}
    48	
    49		return TONES_INVALID;
    50	}
    51	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
