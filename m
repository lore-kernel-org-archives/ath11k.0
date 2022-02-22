Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5A64C433F5
	for <ath11k@archiver.kernel.org>; Tue, 22 Feb 2022 13:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x2GSrUNGUZ42sZq6EwO0xDP3/nZYji0r+RQgsCBP9S4=; b=A9mHY+rtxlE/Cw
	dHqxfBgZX5mTiijxf8s/mEYrN65Q3PaI9xSWqd3uinS8t65ieo6AK4KAsovrZbx7nlQYJ5NMex9eS
	D7geD7Aw0WfAkVwb9/tJ3o80phANZF80zvHuejXmQhCSSJaFPg0s9HbZ25r+8InR5FZzhRg4sDYJN
	1d1v5j02Mhoct/8xuHUPd2M+ORFjRdNlbZ1SlWMIUpzpggpcHWmqq5EahnE4ZNWw0c6sf8mzJ7wHC
	gzVBgKxHSfVfsF+0z3rKpC4v/ZDzOhNVmqcXoitcswJVvaEoCBzLHlF2l9xWUi5d3wmG+dSCKHkyz
	wZmhHOzUY+3TAufK7Haw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMVdQ-009ltf-2F; Tue, 22 Feb 2022 13:55:20 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMVdD-009lrJ-NW
 for ath11k@lists.infradead.org; Tue, 22 Feb 2022 13:55:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B58E4B819DB;
 Tue, 22 Feb 2022 13:55:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 444DBC340E8;
 Tue, 22 Feb 2022 13:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645538104;
 bh=d3Ixbs5zOqFFSUn/uSyDBoc0z2LozIOdrEAz6XPaqJQ=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=I3phl1BsGuQNzKVyFNNxi+hQFpQq8SNjhbNR9jlnNFx357273Nsi1Nk9u/+Wb38k/
 OaNHRJBQAq4J89dfTGFEwS+ZCcMw8nUry6IqC6cSAEenXqUlnW/ypDXwoxUpIx5Epq
 TLrNyrm3UfUMbS2W76cd0eDDFFnbQNclsCmfK1uQA9hnJiSOQe/UBxoNxSfT0TpX5t
 7keMRoG9PAgE2cE0u5p3xqIk/6riqthQvVrWZWTUnYapy2FyRSe7lpJ9VH1cCRxx5c
 mSDzixJQb2/eogZONsR8UTjh4We3C+xktXf+fwsNt+i59VB1IpOQFcqhv5X+A9v2Fy
 pMVAh2/KVNX5g==
From: Kalle Valo <kvalo@kernel.org>
To: Carl Huang <quic_cjhuang@quicinc.com>
Cc: <ath11k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v3 6/6] ath11k: support GTK rekey offload
References: <1644308006-22784-1-git-send-email-quic_cjhuang@quicinc.com>
 <1644308006-22784-7-git-send-email-quic_cjhuang@quicinc.com>
Date: Tue, 22 Feb 2022 15:54:59 +0200
In-Reply-To: <1644308006-22784-7-git-send-email-quic_cjhuang@quicinc.com>
 (Carl Huang's message of "Tue, 8 Feb 2022 16:13:26 +0800")
Message-ID: <875yp7vwek.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220222_055508_375422_F576FED3 
X-CRM114-Status: GOOD (  11.11  )
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

Carl Huang <quic_cjhuang@quicinc.com> writes:

> Host sets GTK related info to firmware before WoW is enabled, and
> gets rekey replay_count and then disables GTK rekey when WoW quits.
>
> Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1
>
> Signed-off-by: Carl Huang <quic_cjhuang@quicinc.com>

[...]

> +static void ath11k_mac_op_set_rekey_data(struct ieee80211_hw *hw,
> +					 struct ieee80211_vif *vif,
> +					 struct cfg80211_gtk_rekey_data *data)
> +{
> +	struct ath11k *ar = hw->priv;
> +	struct ath11k_vif *arvif = ath11k_vif_to_arvif(vif);
> +	struct ath11k_rekey_data *rekey_data = &arvif->rekey_data;
> +
> +	ath11k_dbg(ar->ab, ATH11K_DBG_MAC, "Set rekey data vdev_id %d\n",
> +		   arvif->vdev_id);
> +	mutex_lock(&ar->conf_mutex);
> +
> +	memcpy(rekey_data->kck, data->kck, NL80211_KCK_LEN);
> +	memcpy(rekey_data->kek, data->kek, NL80211_KEK_LEN);
> +
> +	/* supplicant works on big-endian, converts to cpu-endian */
> +	rekey_data->replay_ctr = be64_to_cpu(get_unaligned((u64 *)data->replay_ctr));

This has a warning:

drivers/net/wireless/ath/ath11k/mac.c:8219:34: warning: cast to restricted __be64

In the pending branch I changed this to:

	/* The supplicant works on big-endian, the firmware expects it on
	 * little endian.
	 */
	rekey_data->replay_ctr = get_unaligned_be64(data->replay_ctr);

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
