Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8D23C433F5
	for <ath11k@archiver.kernel.org>; Sat, 12 Feb 2022 18:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mPLQFWvEY3KFTEF5pVoo5W+2O9EKtXS423ObRwUoO4g=; b=U+IVKQJ20kx29P
	TQRS0KJxxNmoCrxK9lWNB89pJYBGjhyy7hoYObYPYdFWCJGYZtJ/gGT5MMgv3rc0m3AvixzrM/ckK
	HSHpnjuGpDIecjGiupMWBgqfqlIvnzu5rHGbNiB/uxUWJxYXli0jxgK2RDF9r3QD04dyJMN3Oxi83
	3ITFNiYuUyebL/I3w5/Jg+vggUZw4r7WQZ/3poHHCkZZb+aotmh3gmnuMnBVa9qxkl50zwAAooVaN
	sSgtPvfaP1VNrfU+2lFZZIgfNBAaWQgQIF0GpJj9XH9e3dHjikWTeNZfD/i207LMPgyf8bB/Gx2zd
	aeqswq1dhDBeD2KSuB6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nIwyP-00AJPj-Sh; Sat, 12 Feb 2022 18:18:17 +0000
Received: from mga09.intel.com ([134.134.136.24])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nIwyM-00AJP1-6V
 for ath11k@lists.infradead.org; Sat, 12 Feb 2022 18:18:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644689894; x=1676225894;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=DbBWKQigkVd4E7a1OuNYzPs+0CB6gRd1vWjot3q/liA=;
 b=hJ5sq8Ps/zjyR/3vLP2jmCNsKdFX5Ixl5u5SrAeWI29uKyOMO9x2nunx
 q//WAlK1amnGuUQD5D+Asg5QRGeC6WsDR7asZxXZGWD9fU3DZwHGYPw1K
 MiD+MrPjnx403YaksP8Uc22NOs1/HmcBeHsDSgvG+jciObcu4gjG3LYPP
 UHisPjcuZkkVvwiQoy20NeuIWsy7xWDpma8HcaAC90LSZJCo73138ximx
 1FaUQpY22R4CiffKoNZe+IMzBpTqpNEFhpJ6GpLz7ZmLZSuxv4m2VQzZk
 vR5GNdOxjJRPae+yZ1vU6/rF0dkj5iKR4CPo92k7fnqAlySxBBwMageeM Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10256"; a="249644308"
X-IronPort-AV: E=Sophos;i="5.88,364,1635231600"; d="scan'208";a="249644308"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2022 10:18:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,364,1635231600"; d="scan'208";a="602655568"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
 by fmsmga004.fm.intel.com with ESMTP; 12 Feb 2022 10:18:10 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nIwyI-0006Ub-2s; Sat, 12 Feb 2022 18:18:10 +0000
Date: Sun, 13 Feb 2022 02:17:25 +0800
From: kernel test robot <lkp@intel.com>
To: Venkateswara Naralasetty <quic_vnaralas@quicinc.com>,
 ath11k@lists.infradead.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
 linux-wireless@vger.kernel.org,
 Venkateswara Naralasetty <quic_vnaralas@quicinc.com>
Subject: Re: [PATCH 2/6] ath11k: CFR module initialization and
 deinitialization for IPQ8074
Message-ID: <202202122308.vnm0MdO3-lkp@intel.com>
References: <1644592075-27082-3-git-send-email-quic_vnaralas@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1644592075-27082-3-git-send-email-quic_vnaralas@quicinc.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220212_101814_338958_F322215B 
X-CRM114-Status: GOOD (  14.95  )
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
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20220212/202202122308.vnm0MdO3-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project f6685f774697c85d6a352dcea013f46a99f9fe31)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/d2559d5e11b6761fa81c7b6a5dcd1f506f72ef96
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Venkateswara-Naralasetty/ath11k-add-single-shot-periodic-CFR-capture-support-for-IPQ8074/20220211-230911
        git checkout d2559d5e11b6761fa81c7b6a5dcd1f506f72ef96
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/net/wireless/ath/ath11k/ drivers/platform/x86/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/net/wireless/ath/ath11k/cfr.c:29:6: warning: no previous prototype for function 'ath11k_cfr_ring_free' [-Wmissing-prototypes]
   void ath11k_cfr_ring_free(struct ath11k *ar)
        ^
   drivers/net/wireless/ath/ath11k/cfr.c:29:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void ath11k_cfr_ring_free(struct ath11k *ar)
   ^
   static 
   1 warning generated.


vim +/ath11k_cfr_ring_free +29 drivers/net/wireless/ath/ath11k/cfr.c

    28	
  > 29	void ath11k_cfr_ring_free(struct ath11k *ar)
    30	{
    31		struct ath11k_cfr *cfr = &ar->cfr;
    32	
    33		ath11k_dbring_buf_cleanup(ar, &cfr->rx_ring);
    34		ath11k_dbring_srng_cleanup(ar, &cfr->rx_ring);
    35	}
    36	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
