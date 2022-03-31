Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F367C433EF
	for <ath11k@archiver.kernel.org>; Thu, 31 Mar 2022 11:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xlZGo+Lf+ZvnMwAijeszJ2bAreYaQxYEUriPiodu4kM=; b=NFz33shy4N7fKV
	hf+PZKuXa8Xl5wiY67J4J5c7f4Q2TLc8XpCewjhEuH6gmdvpL2z8lxwQ2XV7o1HI3vkx+31N6jEVr
	4CBS/187zU4q/1I7Tu1Yomg1iJpSYrIamKswAdnDvi9dIPlR4RbLgr+GeTSxjpEtNrpP0Ot8nmgTs
	9xOKkHg06ybCVLldnMeUQ1FAw7TPQeZQqL1T+G9qOxPC7/Pqe+siZ3loXf5hZIvaqm50tniLSu+ww
	HNIk4N8Qw+shgVsu/orA3jLe97/gFvKuzrVkCoDeC4I57sNJOgtmdkZukVJYPte/C0wbGUyTYt1pl
	+iylTjwcCKuPjxqhJU9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZtSf-0026VQ-B0; Thu, 31 Mar 2022 11:59:33 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZtSN-0026JU-Eb
 for ath11k@lists.infradead.org; Thu, 31 Mar 2022 11:59:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
 Resent-Cc:Resent-Message-ID; bh=iu2GQb788hJrg8Ry1hz+aY4HjHu+m64LJJ9DY9DclMY=; 
 t=1648727951; x=1649937551; b=e9r3DXUT11dUQLZdweEiw1eVwq+mihuSjw+i3F9/cZ1JgGw
 HfTkOpbjYcbyKZppBcbmfUo6f6EmVNgYiItvD4z4Mj98OFMcJoODRKNmr3qP0LqYkoJgXRCB+oKiT
 R4B598d+xLHfXXFC54baAtRXsMRtqHQDVLt9Me+WRh5SAH6ZnnBbaY9oO4B8q4uIrIY5UzyhBbTrB
 wrl7aN6Mw+5LayngzcrvnnuEzlszN/paAt3g2udW9acSV21XY06eAlZffImGOegp1CXNvUVa/xCZl
 SLmia1io5bWCrtkUebRUM7ZH2tdzJ/1DNaMFfasahKnVnuDVXvrXJ19DTUtNgc3A==;
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.95) (envelope-from <johannes@sipsolutions.net>)
 id 1nZtSD-002woy-AY; Thu, 31 Mar 2022 13:59:05 +0200
Message-ID: <2f25bb87e665488b30f6fdaa5877ad8b5b19da0a.camel@sipsolutions.net>
Subject: Re: [PATCH v5.18] ath11k: fix driver initialization failure with
 WoW unsupported hw
From: Johannes Berg <johannes@sipsolutions.net>
To: Kalle Valo <kvalo@kernel.org>, Nagarajan Maran <quic_nmaran@quicinc.com>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org
Date: Thu, 31 Mar 2022 13:59:04 +0200
In-Reply-To: <87sfqyv1td.fsf@kernel.org>
References: <20220331073110.3846-1-quic_nmaran@quicinc.com>
 <87sfqyv1td.fsf@kernel.org>
User-Agent: Evolution 3.42.4 (3.42.4-1.fc35) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220331_045915_551696_383CA783 
X-CRM114-Status: UNSURE (   5.87  )
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

On Thu, 2022-03-31 at 13:44 +0300, Kalle Valo wrote:
> > 
> > Fixes: ba9177fcef21 ("Add basic WoW functionalities")
> 
> Fixes tag is wrong, it should be:
> 
> Fixes: ba9177fcef21 ("ath11k: Add basic WoW functionalities")
> 

$ git config --global --add alias.fixes 'show -q --format=fixes'
$ git config --global --add pretty.fixes 'Fixes: %h ("%s")'
$ git config --global --add core.abbrev 12
$ git fixes ba9177fcef21
Fixes: ba9177fcef21 ("ath11k: Add basic WoW functionalities")

:)

johannes

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
