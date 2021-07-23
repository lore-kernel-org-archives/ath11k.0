Return-Path: <SRS0=bbE0=MP=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0B6AC4338F
	for <ath11k@archiver.kernel.org>; Fri, 23 Jul 2021 09:38:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 80CD260725
	for <ath11k@archiver.kernel.org>; Fri, 23 Jul 2021 09:38:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 80CD260725
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g44/qXS+uAvDJa83nLpeFaKiTCYGLm+G7fSe/WixnT8=; b=1ZTndPkjI2V/cH
	wu62cl0zKgZY7shhcRfMRkCUUZ2JdcsSoUhZGtCGUOjMgNUQHeOOoMggbdpO8FqTcCQTT2HAXzbpv
	mCNjmV4Sze78gQVMBPQCLKhrCu5lobGHv3BUEUXO085vz1HaiwWmJTdKPOK42cDRLPUrLFg3qZ8Fv
	SWtLm4pwtU/cH+TZAZOvE79U6Vm/q9ExlfAPfT3NASb5Az6DmiIkzjDtQIINjknd0oL1l7ipDAtZz
	vGy5yj9ppBGGVaNVu3NNV5+KfkN2b54MPdEhk4MryjWIgqOLIbVySe5gBUJmtFhiTxMCUD3yemH0s
	8tsg+X+lws/0J1GzqcAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6rdA-0047mo-15; Fri, 23 Jul 2021 09:38:08 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6rd7-0047lQ-51
 for ath11k@lists.infradead.org; Fri, 23 Jul 2021 09:38:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
 Resent-Cc:Resent-Message-ID; bh=eUVyJTsXca/APXODLERsMKrpqSYREs/lN68WW+NlIgk=; 
 t=1627033084; x=1628242684; b=iHCfiZEqLsGwl6B7fNA9GhKQHB8/AyKBgSbSGjojnvSZyI0
 H9ez300bPQld/fv+JdDjHGeFYGzvzU+muNXwTGBLKC2H+Mx3gkpZDXJMaXDHeWNnofyMkCji/TtHf
 HEOhJ8y4Af9+ZOyszv1lwNaSSlAohpWt7udllY41dKU04/+5C2+Wlf8V1jSyxiDzxCmD5YpG6Rque
 E1S1Amgvfu35S+iHaOQKw2gEdyn2BviWnhephq/EOHtdJ8p2c/zZwK67zVNPirFOtvY+/VQoyB06v
 Jb7Y8l44z087voZP1A508wrQkq6l5Zov1N9Az63vg9TWnJAVfoTifGbfP23GQ99A==;
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2) (envelope-from <johannes@sipsolutions.net>)
 id 1m6raW-000UP2-Rq; Fri, 23 Jul 2021 11:38:03 +0200
Message-ID: <d9491db4ece67ac78eb39a1078b91a106770fbb0.camel@sipsolutions.net>
Subject: Re: [PATCH 9/9] mac80211: save transmit power envelope element and
 power constraint
From: Johannes Berg <johannes@sipsolutions.net>
To: Wen Gong <wgong@codeaurora.org>, ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Date: Fri, 23 Jul 2021 11:38:02 +0200
In-Reply-To: <20210517201932.8860-10-wgong@codeaurora.org>
 (sfid-20210517_222034_029448_A9A89D57)
References: <20210517201932.8860-1-wgong@codeaurora.org>
 <20210517201932.8860-10-wgong@codeaurora.org>
 (sfid-20210517_222034_029448_A9A89D57)
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210723_023805_263747_FAA149FA 
X-CRM114-Status: GOOD (  11.84  )
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

On Mon, 2021-05-17 at 16:19 -0400, Wen Gong wrote:
> 
> +		if (is_6ghz) {
> +			struct ieee802_11_elems elems;
> +			struct ieee80211_bss_conf *bss_conf;
> +			u8 i, n;
> +
> +			ieee802_11_parse_elems(ies->data, ies->len, false, &elems,
> +					       NULL, NULL);
> +			bss_conf = &sdata->vif.bss_conf;
> +			bss_conf->pwr_reduction = 0;
> +			if (elems.pwr_constr_elem)
> +				bss_conf->pwr_reduction = *elems.pwr_constr_elem;
> +
> +			memset(bss_conf->tx_pwr_env, 0, sizeof(bss_conf->tx_pwr_env));
> +			bss_conf->tx_pwr_env_num = elems.tx_pwr_env_num;
> +			n = min_t(u8, elems.tx_pwr_env_num,
> +				  ARRAY_SIZE(elems.tx_pwr_env));

If anything, that min_t would make sense only if you were actually using
ARRAY_SIZE(bss_conf->tx_pwr_env), but like this it's quite pointless,
just checking again if the element parsing was internally consistent?

I'd probably remove it and throw in a

	BUILD_BUG_ON(ARRAY_SIZE(bss_conf->tx_pwr_env) !=
                     ARRAY_SIZE(elems.tx_pwr_env));

instead.

> +			for (i = 0; i < n; i++)
> +				memcpy(&bss_conf->tx_pwr_env[i], elems.tx_pwr_env[i],
> +				       elems.tx_pwr_env_len[i]);

You also never validated that the element wasn't too long!


If you connect to 6 Ghz with this, and then again to another AP that
doesn't, you'll have it stuck at the old values. You need to reset at
some point (during disconnect).

And then two more questions:

1) Could this information change? Should we track it in beacons?

2) Should we at least check it again from the protected beacon or such
after association, so we don't blindly trust the probe response or
beacon (received during scan, not validated) at least when BIGTK is in
use?

johannes


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
