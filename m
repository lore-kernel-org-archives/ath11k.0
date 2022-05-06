Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79FE3C433EF
	for <ath11k@archiver.kernel.org>; Fri,  6 May 2022 06:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3m2W3oGxsV4PpRHa+zQbN173dA1v6p7+M01HlqDB210=; b=s/VHHZu1pPl7nz
	ADRH+RCdgk64mG6h1QP+84zKGyVkrwXmuo8ZslN+UFqWI/ZtWptcV+RUT8mnysz0E3Sd+gYMW94hc
	+ijZCtLbyuwBLes0oPC2TCDNOg4X0dKfePf5pjAMW9J120PvdVs/TLRQFgCfpa0sCWkOolPK6Zwmc
	Pux6WIvFuqOAzECDd400Ug8qm5lvuX90xWpMu2puGPbsq+RfYPcAGPHx27HjP+LEcvUFM1faTS+ZK
	73eetKEtAe7ETBfH2jGLDWml5wQRLvkdHetqNDT/0JAkkuif9Cl538EbLqjkSb8cxfp/x03WvT1kR
	MM6Nyld3bFh0zWu2eG2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmrWL-001bp5-Kh; Fri, 06 May 2022 06:32:57 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmrWI-001bob-S7
 for ath11k@lists.infradead.org; Fri, 06 May 2022 06:32:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3A81061EFD;
 Fri,  6 May 2022 06:32:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB70CC385AA;
 Fri,  6 May 2022 06:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651818773;
 bh=td6aIKeZS3fL2oBY4q7hlIvKyZu+yRY4seDjYhJ0BaA=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=Kj7Gv3XE2JkJVwQUwCLzWzl55ambMzYx/aPMtu/QjwgWPRYbEwbMWr6yXcS7ungUD
 4ogIxrltOOsNmDiy8PX53CKbdQ5V5Zll/PZwxH4wpj3Q49N85cPyd1c14B/pMu2FIp
 SV9uIQslDleIPrnO6B/fEyBzhlx9U1y7xJ07mEt62Ycgh+hjDyKlYJRBXYR+fi140+
 xV8mVXc781Ytz0r0FuvjkPxN+YfgeWN249YB7q7oaKA+uvWo8YZPX257tkTspiRP7E
 WP/1SLhiI6h8iJsgCzGQpjYVRVuxhKtkIOYbNkdNe6UbYAb0v3uiRppFMfWsIaysPt
 tZFT+dIHxR8CA==
From: Kalle Valo <kvalo@kernel.org>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: <ath11k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v3] ath11k: Handle keepalive during WoWLAN suspend and
 resume
References: <20220506012540.1579604-1-quic_bqiang@quicinc.com>
Date: Fri, 06 May 2022 09:32:49 +0300
In-Reply-To: <20220506012540.1579604-1-quic_bqiang@quicinc.com> (Baochen
 Qiang's message of "Fri, 6 May 2022 09:25:40 +0800")
Message-ID: <87fsln9nn2.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220505_233254_983631_19BEAFC0 
X-CRM114-Status: GOOD (  17.67  )
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

Baochen Qiang <quic_bqiang@quicinc.com> writes:

> With WoWLAN enabled and after sleeping for a rather long time,
> we are seeing that with some APs, it is not able to wake up
> the STA though the correct wake up pattern has been configured.
> This is because the host doesn't send keepalive command to
> firmware, thus firmware will not send any packet to the AP and
> after a specific time the AP kicks out the STA.
>
> Fix this issue by enabling keepalive before going to suspend
> and disabling it after resume back.
>
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
>
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>

[...]

> +int ath11k_wmi_sta_keepalive(struct ath11k *ar,
> +			     const struct wmi_sta_keepalive_arg *arg)
> +{
> +	struct ath11k_pdev_wmi *wmi = ar->wmi;
> +	struct wmi_sta_keepalive_cmd *cmd;
> +	struct wmi_sta_keepalive_arp_resp *arp;
> +	struct sk_buff *skb;
> +	size_t len;
> +
> +	len = sizeof(*cmd) + sizeof(*arp);
> +	skb = ath11k_wmi_alloc_skb(wmi->wmi_ab, len);
> +	if (!skb)
> +		return -ENOMEM;
> +
> +	cmd = (struct wmi_sta_keepalive_cmd *)skb->data;
> +	cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG,
> +				     WMI_TAG_STA_KEEPALIVE_CMD) |
> +				     FIELD_PREP(WMI_TLV_LEN, sizeof(*cmd) - TLV_HDR_SIZE);
> +	cmd->vdev_id = arg->vdev_id;
> +	cmd->enabled = arg->enabled;
> +	cmd->interval = arg->interval;
> +	cmd->method = arg->method;
> +
> +	if (arg->method == WMI_STA_KEEPALIVE_METHOD_UNSOLICITED_ARP_RESPONSE ||
> +	    arg->method == WMI_STA_KEEPALIVE_METHOD_GRATUITOUS_ARP_REQUEST) {
> +		arp = (struct wmi_sta_keepalive_arp_resp *)(cmd + 1);
> +		arp->tlv_header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_STA_KEEPALVE_ARP_RESPONSE) |
> +				 FIELD_PREP(WMI_TLV_LEN, sizeof(*arp) - TLV_HDR_SIZE);

This added a new warning:

drivers/net/wireless/ath/ath11k/wmi.c:8989: line length of 94 exceeds 90 columns

I fixed it in the pending branch, no need to resend because of this.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
