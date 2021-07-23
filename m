Return-Path: <SRS0=bbE0=MP=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8642CC4338F
	for <ath11k@archiver.kernel.org>; Fri, 23 Jul 2021 09:33:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5615560725
	for <ath11k@archiver.kernel.org>; Fri, 23 Jul 2021 09:33:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5615560725
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8q7khW8hGIETBpJi0l4DLV6EjrykkwJsrac9dFIK4pg=; b=Os1z0CL2wOsUeg
	wL5fEZ6BsH38S/L9lnkLsJX6kRlzUYweKT+ZQBxJlD5NKzCCzCtJfQnmpGrdoHm0MxVu2x2kf6pZ8
	dOSYmqMg3WDXnoC1RwYk8BamDrBb+g/zlz34KUXUGuDMr7tu3WTfASHhIXujX9jlPsImW4IBVuixT
	UOPV+/e2OX+/4TQxMTTyKBtcqcsZxLGCJUV+K8bY8izoVEMLuuQBiZgiblzXs4RdcE2IAYlGOtYrZ
	OTvIMZCj87PbBycM6iqbxM5HggEO/11hywfC52BqYVnT/LjBANneOZ1f1xjLTIcGzlDynk9zS8Mja
	DKLmjF7iA90MhxFKAfjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6rYz-00475W-7q; Fri, 23 Jul 2021 09:33:49 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6rYx-00474y-0t
 for ath11k@lists.infradead.org; Fri, 23 Jul 2021 09:33:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
 Resent-Cc:Resent-Message-ID; bh=eEgru/BErxZ5RFckEhJVfW2QEESEkpBfrJ0xlqtEV60=; 
 t=1627032826; x=1628242426; b=Eg55y7XC393fPI5TlKDK/BqCc/4m/xoRWkGJfVvxAKdfXYy
 zdvywkdMJiv4GaQn8Vh6NSUPseswARImnRJEuptVFn7AiYV5oAV//O/NW4Ikc0ctgS264Jxqy1wUT
 97lBSjAutZlk3rXAfSgaPG2hmirsLum7i/ZNu7SPD5YCU0Od/fr9zGcpI1uRWTYWCO0irFsbOkYGQ
 3S9zFDpF6kcz6FlK7sdHjeiktDIPyt9xN8snBii2y3T+sWZsl0cxxs4FsI1F7t93pcJ8/U7fYytiJ
 LN72IrJb0eBa9oRQ8RhsUHMOVbZE+0ys3dIQWDttI2uQg48ZKD/dwkMmJLCNaoqA==;
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2) (envelope-from <johannes@sipsolutions.net>)
 id 1m6rWM-000UEO-Or; Fri, 23 Jul 2021 11:33:45 +0200
Message-ID: <c5d0572a6f2076170a1f50e2b33db82ccfe5adf0.camel@sipsolutions.net>
Subject: Re: [PATCH 8/9] mac80211: add transmit power envelope element and
 power constraint in bss_conf
From: Johannes Berg <johannes@sipsolutions.net>
To: Wen Gong <wgong@codeaurora.org>, ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Date: Fri, 23 Jul 2021 11:33:44 +0200
In-Reply-To: <20210517201932.8860-9-wgong@codeaurora.org>
 (sfid-20210517_222030_180537_A7E27982)
References: <20210517201932.8860-1-wgong@codeaurora.org>
 <20210517201932.8860-9-wgong@codeaurora.org>
 (sfid-20210517_222030_180537_A7E27982)
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210723_023347_111684_C0ECFC9C 
X-CRM114-Status: UNSURE (   5.43  )
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
> This patch is to add definition of transmit power envelope element and
> power constraint in struct ieee80211_bss_conf for 6GHz.

This does nothing, please squash with the next patch.

johannes


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
