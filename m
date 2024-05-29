Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CD78C25B75
	for <ath11k@archiver.kernel.org>; Wed, 29 May 2024 14:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/yGgtANfHFObW2yk4b9MyUemICbrjWPAQ6FaTZw/zLY=; b=p0y8WeHVcVgXBHQNrx1wXd0f5Y
	tMWBgrvRhxoUNuwdiIyuZuAlfgWzXcPK9u6fBDAu0UjX/fC8AuzaRs8c4DaK9x3CIMow7eIsp5HzO
	YAyCWpUEDnj4BJDIVY28UhAEnyZkLBAm7eYrxRZ98KDODdfefnrq7l4b0Hknpplsztv+Ee4S+XyNk
	6bMO3IxkbMKtQUrHTuBORgs26E9GvnmSLi9m897nBKMf7sSHN5IaD8R9IoY1StUr22hl0e1Cmi1uS
	m/x+E94x13JVtYvAFPdWBnQeUiAqJCFx+KUElWuJfRBcaCvOVlbB3cDv+HB5IEQCR0qRlrWdYb1Re
	7qSnyJHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCKMY-00000004TOW-3iTV;
	Wed, 29 May 2024 14:33:11 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCKMU-00000004TLR-3aEA
	for ath11k@lists.infradead.org;
	Wed, 29 May 2024 14:33:08 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-a632ba6c9dbso275419966b.2
        for <ath11k@lists.infradead.org>; Wed, 29 May 2024 07:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716993179; x=1717597979; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/yGgtANfHFObW2yk4b9MyUemICbrjWPAQ6FaTZw/zLY=;
        b=o8ke6R4YySZTAi+/mQq01ZZGKVuS+YYogP+JsBSEbFNeptmEgyjkSt3F2jhWRZXffD
         nGQZusgDPPOd9qC90RC+LDxk8f7hBejuqimbOXhGmdbQM+nLpwj/Bo74VAllR2wxO+JN
         BPqc9GWz1elFkn3f25MRfuN76FARer6uEUmON4Cb1MlXdpSRVxL8RBi4uBJc9UwwsBAX
         52CdUTyd/xRKzpau6AEtWo0EZp1KvJlp/g31k9FLv+NNekDH9UZUtHpUwXp3trPZwQ5A
         hy+F+mGLfH7c4iuYi6b0/GlNu6Vjff/AQXzKtfWhKq7DXb5Mds/hyXCRPXecvfAt6XNC
         gSnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716993179; x=1717597979;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/yGgtANfHFObW2yk4b9MyUemICbrjWPAQ6FaTZw/zLY=;
        b=D98Xs2BYS/bWRI69gc4r9jT1622fbUow999G5O8wI+Ha14fuNLbub+yEDX2uF7LVjg
         J2VPw8FsjleSfthmR6AM/PyKySssK10zoUUDZp4lUYQdDuw9d13sTUpe2DW+EH6jmBAR
         emizTB5p2oc9zWTd+3X62ySCwPqH0Z/yAccQiUle35RS3VFPdGete+/J10ftVcBIRkOl
         rWrANmU8RWEHhhivEAB9VdKouVfmgmrLHcyD0Rnka6jZapCtQfPpfDrYAT15+h/FYwi9
         XP+sqzd+CxLO7nHIswOz2O80YCZwHqiYlcOdkRkz0xA+L+FuChS2hr9QCJFa+LzO3Ss0
         VMxw==
X-Forwarded-Encrypted: i=1; AJvYcCWJOrQI5K4XXM/7YZ4NkTnisDh6YMzQXy1JGwXvmbPr7kxn2xbFfkFSn/xF3WaT8KMe50aFTzqXJ8tCJRTvXtfaHHQujhNAbhBvVQ==
X-Gm-Message-State: AOJu0Yz6WsN+zrMatmV6Eogy9dUJ5UkAyrgHeYR3MrrCNKARfa8Z0h73
	j3mhlADYVTlV4cpO+2abt2hRTVkL0WFGQF9cJRL61a871p3ZdYg5AcbV5kgC7Vo=
X-Google-Smtp-Source: AGHT+IFH7NS4aP8VmsnC+fzp4RqQSZye8zxVrfpr0Vj3x+zX4noEPHlGmYGdZ5clSANww20gpSAW2g==
X-Received: by 2002:a17:906:f5a6:b0:a62:de57:adbb with SMTP id a640c23a62f3a-a62de57b397mr969367866b.27.1716993178505;
        Wed, 29 May 2024 07:32:58 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a626c81734csm719589266b.45.2024.05.29.07.32.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 07:32:56 -0700 (PDT)
Date: Wed, 29 May 2024 17:32:52 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Kang Yang <quic_kangyang@quicinc.com>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
Subject: [bug report] wifi: ath11k: add P2P IE in beacon template
Message-ID: <2d277abd-5e7b-4da0-80e0-52bd96337f6e@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240529_073306_931419_08C3FF9A 
X-CRM114-Status: UNSURE (   6.80  )
X-CRM114-Notice: Please train this message.
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

Hello Kang Yang,

Commit 3a415daa3e8b ("wifi: ath11k: add P2P IE in beacon template")
from Feb 28, 2024 (linux-next), leads to the following Smatch static
checker warning:

	drivers/net/wireless/ath/ath11k/wmi.c:1742 ath11k_wmi_p2p_go_bcn_ie()
	warn: sleeping in atomic context

drivers/net/wireless/ath/ath11k/wmi.c
    1712 int ath11k_wmi_p2p_go_bcn_ie(struct ath11k *ar, u32 vdev_id,
    1713                              const u8 *p2p_ie)
    1714 {
    1715         struct ath11k_pdev_wmi *wmi = ar->wmi;
    1716         struct wmi_p2p_go_set_beacon_ie_cmd *cmd;
    1717         size_t p2p_ie_len, aligned_len;
    1718         struct wmi_tlv *tlv;
    1719         struct sk_buff *skb;
    1720         int ret, len;
    1721 
    1722         p2p_ie_len = p2p_ie[1] + 2;
    1723         aligned_len = roundup(p2p_ie_len, 4);
    1724 
    1725         len = sizeof(*cmd) + TLV_HDR_SIZE + aligned_len;
    1726 
    1727         skb = ath11k_wmi_alloc_skb(wmi->wmi_ab, len);
    1728         if (!skb)
    1729                 return -ENOMEM;
    1730 
    1731         cmd = (struct wmi_p2p_go_set_beacon_ie_cmd *)skb->data;
    1732         cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_P2P_GO_SET_BEACON_IE) |
    1733                           FIELD_PREP(WMI_TLV_LEN, sizeof(*cmd) - TLV_HDR_SIZE);
    1734         cmd->vdev_id = vdev_id;
    1735         cmd->ie_buf_len = p2p_ie_len;
    1736 
    1737         tlv = (struct wmi_tlv *)cmd->tlv;
    1738         tlv->header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_ARRAY_BYTE) |
    1739                       FIELD_PREP(WMI_TLV_LEN, aligned_len);
    1740         memcpy(tlv->value, p2p_ie, p2p_ie_len);
    1741 
--> 1742         ret = ath11k_wmi_cmd_send(wmi, skb, WMI_P2P_GO_SET_BEACON_IE);
                       ^^^^^^^^^^^^^^^^^^^
This is a might_sleep() function.

    1743         if (ret) {
    1744                 ath11k_warn(ar->ab, "failed to send WMI_P2P_GO_SET_BEACON_IE\n");
    1745                 dev_kfree_skb(skb);
    1746         }
    1747 
    1748         return ret;
    1749 }

The problematic call tree is:

ath11k_bcn_tx_status_event() <- disables preempt
-> ath11k_mac_bcn_tx_event()
   -> ath11k_mac_setup_bcn_tmpl()
      -> ath11k_mac_setup_bcn_tmpl_ema()
      -> ath11k_mac_setup_bcn_tmpl_mbssid()
         -> ath11k_mac_set_vif_params()
            -> ath11k_mac_setup_bcn_p2p_ie()
               -> ath11k_wmi_p2p_go_bcn_ie()

The ath11k_bcn_tx_status_event() function takes rcu_read_lock() which
disables preemption.  I don't know the code well enough to say if this
is a real bug...  If it's a false positive, just ignore it.  These are
one time emails.

See my blog for more details.
https://staticthinking.wordpress.com/2024/05/24/sleeping-in-atomic-warnings/

regards,
dan carpenter

