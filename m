Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A2D3C433EF
	for <ath11k@archiver.kernel.org>; Fri, 11 Feb 2022 19:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6BsrVuR1FG1M/W/UJlEeZxNX5vSlFYrWxY5GIRw3Y0E=; b=43HQchfcOeejAa
	jKbPDV7pdt+jf4ybE8ZehFozAqMR2E6DyO6b0CIfWsTIKeBr3dlVZY4BNWOuVSYJhBDG4rxZJy0o3
	OP4jDCKdPeb+yo2E9NxS5z/y+68JTSYSsPuDN7FdMb3FEriVVcmDc6lxalaiWrEGzj7NZ/jQHs84X
	V0doU+JiH28HN3Mqhex9EZoE+cmbFhYOYzZIflzkrjTg4XvAjT0MivcIgjCnsv+9s3n0QL6Fg9Mk/
	xyHyjsKnrl1RlvuwXYVRZHA0s590Ai9cthvhtMHzq8LLDWoK3xzF3bA/z0jZ7rO5qWbDuFxVuLjqH
	e0O4UTawgTJWkRqvQ9/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nIbeN-008aV2-EQ; Fri, 11 Feb 2022 19:32:11 +0000
Received: from mga06.intel.com ([134.134.136.31])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nIbeK-008aUK-1j
 for ath11k@lists.infradead.org; Fri, 11 Feb 2022 19:32:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644607928; x=1676143928;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=u4/ZzR0zcpRDm7chnBBzsED2Fn151DKbd8zv+LEGexk=;
 b=bGtyHFWsj1u/ycBsfi8NZOaEWv4RN5UIKo96P9e5/JRmM4VF0Td8tSqU
 5xjNB032Pg89CkLywHSWLVwoTQBVoZ+7uK4dOoWFGeRM3IbVB1wTXCqLY
 nwVZkGEXxyLwk6bqPtAjY7gtaKNzesaZymsXDZFZAJCNtfnNT0NIj7jrP
 oBJqumy6iEjs1KCDNNUtAxdwyHl1tDFe6hiE5Pm0YU+WmltXsJPFe7DYq
 DgThpQ32v9G05h3xD9xS1PtMYY16Ll40zcsHjkIUeF38G89c4g8rnZERV
 HUIC6Vc/mlYIwJQOVsLK6BSLfsHQIO9LV24sWv/SMndGsJqDpADDENSND w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10255"; a="310533557"
X-IronPort-AV: E=Sophos;i="5.88,361,1635231600"; d="scan'208";a="310533557"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 11:32:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,361,1635231600"; d="scan'208";a="488587528"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
 by orsmga006.jf.intel.com with ESMTP; 11 Feb 2022 11:32:05 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nIbeH-00055N-2j; Fri, 11 Feb 2022 19:32:05 +0000
Date: Sat, 12 Feb 2022 03:31:28 +0800
From: kernel test robot <lkp@intel.com>
To: Venkateswara Naralasetty <quic_vnaralas@quicinc.com>,
 ath11k@lists.infradead.org
Cc: kbuild-all@lists.01.org, linux-wireless@vger.kernel.org,
 Venkateswara Naralasetty <quic_vnaralas@quicinc.com>
Subject: Re: [PATCH 5/6] ath11k: Register DBR event handler for CFR data
Message-ID: <202202120300.QN01zNhr-lkp@intel.com>
References: <1644592075-27082-6-git-send-email-quic_vnaralas@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1644592075-27082-6-git-send-email-quic_vnaralas@quicinc.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220211_113208_163223_6BFA050E 
X-CRM114-Status: GOOD (  12.06  )
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
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20220212/202202120300.QN01zNhr-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/14cd77b4e3109da2eb6b33501640153852c5d2a7
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Venkateswara-Naralasetty/ath11k-add-single-shot-periodic-CFR-capture-support-for-IPQ8074/20220211-230911
        git checkout 14cd77b4e3109da2eb6b33501640153852c5d2a7
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=alpha SHELL=/bin/bash drivers/net/wireless/ath/ath11k/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/net/wireless/ath/ath11k/cfr.c:515:6: warning: no previous prototype for 'ath11k_cfr_ring_free' [-Wmissing-prototypes]
     515 | void ath11k_cfr_ring_free(struct ath11k *ar)
         |      ^~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ath/ath11k/cfr.c: In function 'cfr_calculate_tones_from_dma_hdr':
>> drivers/net/wireless/ath/ath11k/cfr.c:27:17: warning: this statement may fall through [-Wimplicit-fallthrough=]
      27 |                 switch (bw) {
         |                 ^~~~~~
   drivers/net/wireless/ath/ath11k/cfr.c:40:9: note: here
      40 |         case ATH11K_CFR_PREAMBLE_TYPE_HT:
         |         ^~~~


vim +27 drivers/net/wireless/ath/ath11k/cfr.c

    18	
    19	static int cfr_calculate_tones_from_dma_hdr(struct ath11k_cfir_dma_hdr *hdr)
    20	{
    21		u8 bw = FIELD_GET(CFIR_DMA_HDR_INFO1_UPLOAD_PKT_BW, hdr->info1);
    22		u8 preamble = FIELD_GET(CFIR_DMA_HDR_INFO1_PREAMBLE_TYPE, hdr->info1);
    23	
    24		switch (preamble) {
    25		case ATH11K_CFR_PREAMBLE_TYPE_LEGACY:
    26		case ATH11K_CFR_PREAMBLE_TYPE_VHT:
  > 27			switch (bw) {
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
    40		case ATH11K_CFR_PREAMBLE_TYPE_HT:
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
