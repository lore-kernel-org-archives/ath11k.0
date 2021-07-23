Return-Path: <SRS0=bbE0=MP=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AB22C4338F
	for <ath11k@archiver.kernel.org>; Fri, 23 Jul 2021 09:29:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD93760EC0
	for <ath11k@archiver.kernel.org>; Fri, 23 Jul 2021 09:29:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DD93760EC0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QZTxvMEysT3WG+puIYrkqIhPFwPZx8a1E4lbUWjVwH8=; b=riHHKaWf/esj5x
	OI9nww2IGyezlzpWyKfL+r85IleMuLs4ttgcWEu/jf4YnF2EFSMilLqHNPrJGThQrnGirFgngZujl
	HhARZCTY3Nkam+lFTXT0G6z1K/vu70HrwLwvL3XyVI7NcfvWTZoKriOTuaHrAm3Ulpvi7fcwGUr6y
	ajc8Trk/tVphoUgvduhMrv8e66gdKmvokTtn1hql2zMIdmj8/knPhy9jcT+jTNcHhj/RHnmT3SOAY
	BUxd1voVY7E198uW1QbC/XwfKN7I0fQCuH8pCYTXsb419mWe/F6uky5RYOcpTs02nsSCyGgjaDRAm
	kVkGMrW1cd4KaJsh/l8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6rV7-0046jD-P9; Fri, 23 Jul 2021 09:29:49 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6rV4-0046iv-Nw
 for ath11k@lists.infradead.org; Fri, 23 Jul 2021 09:29:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
 Resent-Cc:Resent-Message-ID; bh=3Qm6xZcMymKdfo9RM5NqXirB4Wo/7ICAOvyA6DwlxQg=; 
 t=1627032586; x=1628242186; b=InNV+jVbTSh2fUmoYUQBhVUnWmWM5G/CmHF9P3X/BD2CUoZ
 A2lGac4DiiKiI6D8bGboooYs6eRF74loeyMkfpjf26IA7PooiyejGrvUV8ZqQnRzeHCZuV0xaLfHC
 49eggFCNpfnuOmlPO/n6xMsRZxI4Lzq34eSJn86mAZGXX0gJYtnU/604tPHZ2zp9PF4S6kQSeVs1E
 4wWuiASqd4p34hQlG2CN5avAQMzYyzMkUEnlBY+8MQM+ib3RR+EBnugHRXnal15BERv+2mLLDB52R
 R7a5Q9nyQEjB18DKWbVxPFEoK635NgbZopCQ/Wz+uM5B87g1ErL+yiGvfwYpsfcQ==;
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2) (envelope-from <johannes@sipsolutions.net>)
 id 1m6rSU-000U6t-Ga; Fri, 23 Jul 2021 11:29:45 +0200
Message-ID: <58d19c13200063dc0a19625770db0601f047b5a9.camel@sipsolutions.net>
Subject: Re: [PATCH 6/9] mac80211: add definition for transmit power
 envelope element
From: Johannes Berg <johannes@sipsolutions.net>
To: Wen Gong <wgong@codeaurora.org>, ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Date: Fri, 23 Jul 2021 11:29:44 +0200
In-Reply-To: <20210517201932.8860-7-wgong@codeaurora.org>
 (sfid-20210517_222029_289940_80C21857)
References: <20210517201932.8860-1-wgong@codeaurora.org>
 <20210517201932.8860-7-wgong@codeaurora.org>
 (sfid-20210517_222029_289940_80C21857)
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210723_022946_831053_24DD3CB9 
X-CRM114-Status: UNSURE (   6.15  )
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

On Mon, 2021-05-17 at 16:19 -0400, Wen Gong wrote:
> 
> +#define TX_PWR_ENV_INFO_COUNT	GENMASK(2, 0)
> +#define TX_PWR_ENV_INFO_INTERPRET	GENMASK(5, 3)
> +#define TX_PWR_ENV_INFO_CATEGORY	GENMASK(7, 6)

Personally, I'm not a big fan of GENMASK(), seems more complicated to me
than
			0x0007
			0x0038
			0x00c0

but YMMV :)

We haven't really used GENMASK here anywhere else, have we?


> +#define GET_TX_PWR_ENV_COUNT(fv) FIELD_GET(TX_PWR_ENV_INFO_COUNT, fv)
> +#define GET_TX_PWR_ENV_INTERPRET(fv) FIELD_GET(TX_PWR_ENV_INFO_INTERPRET, fv)
> +#define GET_TX_PWR_ENV_CATEGORY(fv) FIELD_GET(TX_PWR_ENV_INFO_CATEGORY, fv)

I don't think we really need these, and we should be using u*_get_bits()
anyway rather than FIELD_GET.

johannes


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
