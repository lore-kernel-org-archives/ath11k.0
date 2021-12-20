Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3634EC433F5
	for <ath11k@archiver.kernel.org>; Mon, 20 Dec 2021 17:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NuTCR0rq3SzWDUyp4eIId+yujiXpsUn/xesm1g/PitE=; b=LAgViRTYEnUchQ
	PSRZlAeR4JKmrDtEa3VnpI9mLyFoHuEkmLVcRgv/CVJ3+UybuYcBorrP+YSltSWKqdyblErddLuwM
	SAGVIgvhTWzdaCmoeppZCumzoRJYUhDQH+XhLMl2pXWPZnAjx7iK5aXze9/uQZ1QFj697mnty1yGT
	yQHw+xZZDfZbNDn5cQt7YGPAcngpGBV+u4hHxfoAxngoKxpUX5kYokepVW0avMQuw+AvRKKjoD+Qz
	7w8VMLILpy+/jbYM9DHRw8UNwcrLmeXWKfs8bP6Xhf6ZGR2c6DHKbIldIP4efx2OqEPFOFVkB0YPY
	G08x/qqMOdz2JcCrViRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzME0-003VKe-D2; Mon, 20 Dec 2021 17:13:24 +0000
Received: from mga12.intel.com ([192.55.52.136])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzMDu-003VGO-4e
 for ath11k@lists.infradead.org; Mon, 20 Dec 2021 17:13:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640020398; x=1671556398;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=MqkVzxr9XhGz20O9djEWhlXF6L01WiGy/1aPYksMFb0=;
 b=dN1sxUPVYmyw7zfJVbsQXzU6valwlzy1fhNFp9nLJBe8PM7EW3CdM1R0
 0Hs6spA8kq9QqM8/+46HYLHiVkAvy7WBNaZx5UZBuKHmJuaf6UWpkpOBj
 g8ZVvjomdAc+tbzugfMa4G4J/yApfd+edfHSBjhaVsK+JfJ98OevnY0FS
 M5rBxaY7qglapFixPO/TAiRIMvu7REc0gXrw45I8gygwtgGDdI2O0b4nA
 DNTfFw0b6elfOwaXBrh9jh74ByX7q+3DepCS4q6paRfccPDXExiVttIvJ
 m1/7qcOB/hV/V5CI8x8mWlvvDHwfMhoBmUt64T/mxUnk6GYSllDZo1gxx g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10203"; a="220239501"
X-IronPort-AV: E=Sophos;i="5.88,221,1635231600"; d="scan'208";a="220239501"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2021 09:13:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,221,1635231600"; d="scan'208";a="569923728"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
 by fmsmga008.fm.intel.com with ESMTP; 20 Dec 2021 09:13:14 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1mzMDp-00081r-I5; Mon, 20 Dec 2021 17:13:13 +0000
Date: Tue, 21 Dec 2021 01:12:15 +0800
From: kernel test robot <lkp@intel.com>
To: cgel.zte@gmail.com, kvalo@kernel.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org, davem@davemloft.net,
 kuba@kernel.org, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Changcheng Deng <deng.changcheng@zte.com.cn>,
 Zeal Robot <zealci@zte.com.cn>
Subject: Re: [PATCH] ath11k: use min() to make code cleaner
Message-ID: <202112210104.cbWjNxoN-lkp@intel.com>
References: <20211220112133.472472-1-deng.changcheng@zte.com.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211220112133.472472-1-deng.changcheng@zte.com.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211220_091318_253158_31632A5C 
X-CRM114-Status: GOOD (  12.59  )
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

Hi,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on kvalo-ath/ath-next]
[also build test WARNING on v5.16-rc6 next-20211220]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/cgel-zte-gmail-com/ath11k-use-min-to-make-code-cleaner/20211220-192326
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath-next
config: hexagon-randconfig-r001-20211220 (https://download.01.org/0day-ci/archive/20211221/202112210104.cbWjNxoN-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 555eacf75f21cd1dfc6363d73ad187b730349543)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/526b459a20794d7325764c3fea5fd3e0521d6084
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review cgel-zte-gmail-com/ath11k-use-min-to-make-code-cleaner/20211220-192326
        git checkout 526b459a20794d7325764c3fea5fd3e0521d6084
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/net/wireless/ath/ath11k/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/net/wireless/ath/ath11k/wmi.c:617:12: warning: comparison of distinct pointer types ('typeof (frame->len) *' (aka 'unsigned int *') and 'typeof (64) *' (aka 'int *')) [-Wcompare-distinct-pointer-types]
           buf_len = min(frame->len, WMI_MGMT_SEND_DOWNLD_LEN);
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:45:19: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
                           ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:36:24: note: expanded from macro '__careful_cmp'
           __builtin_choose_expr(__safe_cmp(x, y), \
                                 ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:26:4: note: expanded from macro '__safe_cmp'
                   (__typecheck(x, y) && __no_side_effects(x, y))
                    ^~~~~~~~~~~~~~~~~
   include/linux/minmax.h:20:28: note: expanded from macro '__typecheck'
           (!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
                      ~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~
   1 warning generated.


vim +617 drivers/net/wireless/ath/ath11k/wmi.c

   606	
   607	int ath11k_wmi_mgmt_send(struct ath11k *ar, u32 vdev_id, u32 buf_id,
   608				 struct sk_buff *frame)
   609	{
   610		struct ath11k_pdev_wmi *wmi = ar->wmi;
   611		struct wmi_mgmt_send_cmd *cmd;
   612		struct wmi_tlv *frame_tlv;
   613		struct sk_buff *skb;
   614		u32 buf_len;
   615		int ret, len;
   616	
 > 617		buf_len = min(frame->len, WMI_MGMT_SEND_DOWNLD_LEN);
   618	
   619		len = sizeof(*cmd) + sizeof(*frame_tlv) + roundup(buf_len, 4);
   620	
   621		skb = ath11k_wmi_alloc_skb(wmi->wmi_ab, len);
   622		if (!skb)
   623			return -ENOMEM;
   624	
   625		cmd = (struct wmi_mgmt_send_cmd *)skb->data;
   626		cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_MGMT_TX_SEND_CMD) |
   627				  FIELD_PREP(WMI_TLV_LEN, sizeof(*cmd) - TLV_HDR_SIZE);
   628		cmd->vdev_id = vdev_id;
   629		cmd->desc_id = buf_id;
   630		cmd->chanfreq = 0;
   631		cmd->paddr_lo = lower_32_bits(ATH11K_SKB_CB(frame)->paddr);
   632		cmd->paddr_hi = upper_32_bits(ATH11K_SKB_CB(frame)->paddr);
   633		cmd->frame_len = frame->len;
   634		cmd->buf_len = buf_len;
   635		cmd->tx_params_valid = 0;
   636	
   637		frame_tlv = (struct wmi_tlv *)(skb->data + sizeof(*cmd));
   638		frame_tlv->header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_ARRAY_BYTE) |
   639				    FIELD_PREP(WMI_TLV_LEN, buf_len);
   640	
   641		memcpy(frame_tlv->value, frame->data, buf_len);
   642	
   643		ath11k_ce_byte_swap(frame_tlv->value, buf_len);
   644	
   645		ret = ath11k_wmi_cmd_send(wmi, skb, WMI_MGMT_TX_SEND_CMDID);
   646		if (ret) {
   647			ath11k_warn(ar->ab,
   648				    "failed to submit WMI_MGMT_TX_SEND_CMDID cmd\n");
   649			dev_kfree_skb(skb);
   650		}
   651	
   652		return ret;
   653	}
   654	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
