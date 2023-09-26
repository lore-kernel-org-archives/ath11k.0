Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AEB0E7E652
	for <ath11k@archiver.kernel.org>; Tue, 26 Sep 2023 16:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oL9C0sVhc6mU7uuxUPaayQJUIIO8GsYO/E8zX4DfG8s=; b=gJxt+FwtxlDJ1e
	AdJtzmdDXzPH7Xc86wWnGs/sgLoZEfgai2Cuiiktr8bWz8fZMTqmwVwrnBDHO7G3xABbfURZwbwqC
	xwh5oUAdrKQfhFmWha3T4NuDrpaWsnMQ4zhkVZmxjysLSkyAKR/dwQBIHWMCA+QemVXm5SZBREwoQ
	vob8yp3yLhyocpnRyBgafPrr4yuPn2i7YwFd1d2a5o4ZpcmWsO2Mooh1HAcBV8Jmo1X/zT2AachgD
	ZOQEGqKxtt78nttX61h33RxDUhzdHb8kT7SGJgj4H6APVil2MQVDSZSJNHc/J/pr+4ogpv6lk2aRS
	qwiqExyVjz0NBYiY/9Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlBAJ-00Gji0-3A;
	Tue, 26 Sep 2023 16:44:03 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlBAG-00Gjhb-2j
	for ath11k@lists.infradead.org;
	Tue, 26 Sep 2023 16:44:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=COVzJlCjkIJzEAzNkBevFRzBhs8gP5wTdIzIYOr5xsM=;
	t=1695746639; x=1696956239; b=GYabd/QFdu9Y7CIXSk+kf7pnDJAEai0iCLqfGwfWkZ3DcU4
	LrO9TjPstDo8HXZD+Y4S/4iqKHM6g7KggZJUcyl8odusOIodNf1UUraWcRpBDI+5lNy/N6fqcoaCL
	SLDArJ5RnqdW6ctUXhhS13nUtPxjNIKaHQhHoROSJAOqulNxBz3Yvd2IhFuml8JpPsw2L1VgrpliA
	FgFMJ4SXNXnL16ZqK4pWDkBgC3xQ72Gnh6lU+llKUrq/hS3ZcLOG4RMYO3dZ/oE49RJc14ObqL9ZD
	vcIGLsUfj8EoS89NzO4GzSx0THoxFp5aRiRbAf5DrVdQuHHduseI/HeIz8oRKP8g==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <johannes@sipsolutions.net>)
	id 1qlBAD-005qwV-1s;
	Tue, 26 Sep 2023 18:43:57 +0200
Message-ID: <49b5de54ca00f5521ceaa8210f587f2af48d6835.camel@sipsolutions.net>
Subject: Re: [PATCH v2] wifi: ath11k: mac: fix struct
 ieee80211_sband_iftype_data handling
From: Johannes Berg <johannes@sipsolutions.net>
To: Kalle Valo <kvalo@kernel.org>, ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Date: Tue, 26 Sep 2023 18:43:56 +0200
In-Reply-To: <20230926163350.2641064-1-kvalo@kernel.org>
References: <20230926163350.2641064-1-kvalo@kernel.org>
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230926_094401_115428_C196BFC8 
X-CRM114-Status: UNSURE (   5.17  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On Tue, 2023-09-26 at 19:33 +0300, Kalle Valo wrote:
> 
> -	he_mcs_map = le16_to_cpu(ath11k_mac_get_tx_mcs_map(&sband->iftype_data->he_cap));
> +	he_cap = ieee80211_get_he_iftype_cap_vif(sband, arvif->vif);
> +	he_mcs_map = le16_to_cpu(ath11k_mac_get_tx_mcs_map(he_cap));

Technically, ieee80211_get_he_iftype_cap_vif() could return NULL if you
didn't actually configure/enable HE for this iftype, the static checkers
might complain here.

johannes

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
