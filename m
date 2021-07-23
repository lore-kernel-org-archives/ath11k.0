Return-Path: <SRS0=bbE0=MP=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F288C4338F
	for <ath11k@archiver.kernel.org>; Fri, 23 Jul 2021 09:23:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 178BC60ED4
	for <ath11k@archiver.kernel.org>; Fri, 23 Jul 2021 09:23:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 178BC60ED4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6sFxqLvgkVFfx5DqPItji02toZCGhiqOe0hGoEPER5U=; b=TrNoDtpU77H30s
	nQ1P/LlvuHM/HcVbt6/ODmnkpxr5UiSY2aR5BpHpqrSa2z+j5tfPHsa/XbbaaxwXLQyL28pM0HOwC
	zvw99mdrKDdmDieRDCwUlujoEygy+H7dFztIsJFOnybGk0s3SagfGIjXCGVIWPpfiywkmnPoQLco5
	1HLt1JX/ZgMveROKivJ6MyhGKjnwM2ErTWi6YU9jGawlTKrX93ZTYFgPIQplrLYAAtLDeHe+xAgUo
	vq4Le5Oo+BhpOfrOwH4vyKZE1dbSmxTaEwwjfb9PyDuBaCeC8UJjYPBF0Vzjz0pcTldZBQm8nW+4i
	IDXt0dK5BOsjSjAFlYHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6rOm-0046L3-0O; Fri, 23 Jul 2021 09:23:16 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6rOj-0046Kk-NE
 for ath11k@lists.infradead.org; Fri, 23 Jul 2021 09:23:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
 Resent-Cc:Resent-Message-ID; bh=r5cwD4SqBwKFbUOXyNm3ivl2yIn3BK5PAFCB14rQW6w=; 
 t=1627032193; x=1628241793; b=lhTcTGctLM0eZ8fewIbxKTfvjmlNDge99d0viXsvsXQKbKh
 7MgADoDGbTZfxhalSKZyd8MB3cEwshdFkdXYDy+cI+pZ051YJ93b+Yr3hS1PsES9yw9nzFRT9nAFo
 6gjv5sZqf/I6HTIOUatR/BWb2TCOKd/AZkFbHCXKLla0qb4vKNpcFVXrrMk/9f8re+SLRyFtinGME
 flm6c2+hZTfhF+K+q+GD0Lp3Ken/29YmXBxSWL7IgIZd2w/5d1jS4m8W4hTBzJeVnFwHaM4WZUO2W
 NAFb0EzRqQahFx18DunQ3G7DDDmkOiHpRs64j5JDLYWqTVXgeDhoG/MYYyLey06Q==;
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2) (envelope-from <johannes@sipsolutions.net>)
 id 1m6rM9-000Ty0-Dh; Fri, 23 Jul 2021 11:23:12 +0200
Message-ID: <0a958db9948bc16fce0ab1e3b7d010ca64f5a18b.camel@sipsolutions.net>
Subject: Re: [PATCH 3/9] mac80211: add parse regulatory info in 6G Hz
 operation information
From: Johannes Berg <johannes@sipsolutions.net>
To: Wen Gong <wgong@codeaurora.org>, ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Date: Fri, 23 Jul 2021 11:23:11 +0200
In-Reply-To: <20210517201932.8860-4-wgong@codeaurora.org>
 (sfid-20210517_222019_338829_5D3A5A0F)
References: <20210517201932.8860-1-wgong@codeaurora.org>
 <20210517201932.8860-4-wgong@codeaurora.org>
 (sfid-20210517_222019_338829_5D3A5A0F)
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210723_022313_802869_D94DDD41 
X-CRM114-Status: UNSURE (   3.83  )
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

> 6G Hz
(subject)

You have a few different ways of spelling "6 GHz" in this patchset,
sometimes only 6G, sometimes like this - I'd prefer it be consistently
spelled as "6 GHz" :)

johannes


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
