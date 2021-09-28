Return-Path: <SRS0=DASI=OS=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBCA9C433EF
	for <ath11k@archiver.kernel.org>; Tue, 28 Sep 2021 13:02:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A0C8603E7
	for <ath11k@archiver.kernel.org>; Tue, 28 Sep 2021 13:02:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8A0C8603E7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sK2Y7KuuG8BO9H/ZBk7/bDkh5jPx86upoRADwo35H2k=; b=GKY+IwxGKXaxqw
	6Z3sd4UTxmSwhTjYjya81M78jxlp8IH3rbA1yr1IGz3L/AVPTV8Stq2xBMsMqtHhZe3nwymLuZtfW
	d2DM2sgPONZzgREjVIw10sGdauKoSG/iMe7HECEIGqCD2Y4VPFEdz1BmsQYDbXUCRyyO695y/KJfn
	VXXEUIB67g0v8799bzcBS88SXEjZJ2qVpqYZNoD+06oI+86qb6/UGeMwINPt43OB5r72bxOi0aNIO
	3aCIJOa5Tx6xcA7awXlukdsyRuQZ+HMMVUB/7uBECLaOlRpMqmarz/5kcPZFxkimRTM48E8w8tnIJ
	Qz2skF23O+GOCzk41LIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVCky-007GRC-Fa; Tue, 28 Sep 2021 13:02:48 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVCkv-007GQY-Ir
 for ath11k@lists.infradead.org; Tue, 28 Sep 2021 13:02:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
 Resent-Cc:Resent-Message-ID; bh=82QXwbQwRc7AQzFplXvtgyMLY9lq/mlIgdTi9zboqE4=; 
 t=1632834162; x=1634043762; b=dX+VZImAaDFbhyk4etGUXiNg34ldsv7epcVJfqJ0coQErxe
 RoXLZdi0H2MOaIDuNfFnfWalfiQvazrC4VlLWyEe0x7SJ2zb1/nFi9cNsbNqDM4S5w35t9+dbGY6v
 Hz+2KQXHQn7dFJNzEJz4Ddjotk1Y9Cx/vto4P/NaxaZTVhg8X6Sc6zEA6zdovJobJzWVDZd1RfqJL
 KyzAV2qNT0lk6+e29oQipZSJbNnO9bBzLtib/xJXsGvjJCpNn8A8eHf7Uk0yuGA27oVHVf1sgTczQ
 oi/Mih336dq9ibePphTvqbax8OIqHfBFHTcxw48+85uGlMvLfuGpbPGyBeVVZw4g==;
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.95-RC2) (envelope-from <johannes@sipsolutions.net>)
 id 1mVCkp-00CsjS-Ux; Tue, 28 Sep 2021 15:02:40 +0200
Message-ID: <b6c96c4ecdf9ec175d7f89e8600fb53768287cc2.camel@sipsolutions.net>
Subject: Re: [PATCH v3 2/2] mac80211: do intersection with he mcs and nss
 set of peer and own
From: Johannes Berg <johannes@sipsolutions.net>
To: Wen Gong <wgong@codeaurora.org>, ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Date: Tue, 28 Sep 2021 15:02:39 +0200
In-Reply-To: <1609816120-9411-3-git-send-email-wgong@codeaurora.org>
 (sfid-20210105_041051_256789_4F276B28)
References: <1609816120-9411-1-git-send-email-wgong@codeaurora.org>
 <1609816120-9411-3-git-send-email-wgong@codeaurora.org>
 (sfid-20210105_041051_256789_4F276B28)
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210928_060245_650461_12F08A63 
X-CRM114-Status: UNSURE (   6.68  )
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

Hi,


I had done a bunch of fixups to this patch, but the zero-day build robot
correctly reports that:

> +	ieee80211_he_mcs_intersection(&own_he_cap.he_mcs_nss_supp.rx_mcs_80,
> +				      &he_cap->he_mcs_nss_supp.rx_mcs_80,
> +				      &own_he_cap.he_mcs_nss_supp.tx_mcs_80,
> +				      &he_cap->he_mcs_nss_supp.tx_mcs_80);

the &own_he_cap... parts here will take an __le16 pointer to a possibly
unaligned variable - any thoughts how we could fix that?

johannes


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
