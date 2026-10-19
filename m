Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 323BBCCF2D3
	for <ath11k@archiver.kernel.org>; Mon, 19 Oct 2026 07:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UgudJ0WI4oNl1UfszSq5K5yCfvW/TgnZ/aoECPr1no0=; b=yzPCZNMpFI+lAclQpY0AbNFZgQ
	9PTQghQG4gMMC6YmG2PZOhjZNQek0x6VxRANwg1crBEOC8bGhfg0pjNS8k3MSMNBPpGyBR4iM6+Lk
	2z9PEsWMFR2yNyb+AX8WsP3+OBMyRRBDhMH9ZGUEtLV0QxNozGZmPyZh2H0cTBwz0azkJdNotG52e
	xw0HJPW4AZbQ8wcodilOP/dhvSoLTf2cz5wDjJj2E1mNkpCmjJRHQVjIegR2bqsyA8Hrb3dZ3EV/O
	Tw/p4BTRpLEuDAE/nohdtgp7gWguCxPF+pTD3pAVpTOIE8dZOAiMcyvz+61EMxwhZ2A4459k5/NQx
	rJReURTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIi0t-00000006mYp-3hKX;
	Mon, 19 Oct 2026 07:42:31 +0000
Received: from mail-yx1-xb132.google.com ([2607:f8b0:4864:20::b132])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIi0s-00000006mYU-00Jc
	for ath11k@lists.infradead.org;
	Mon, 19 Oct 2026 07:42:31 +0000
Received: by mail-yx1-xb132.google.com with SMTP id 956f58d0204a3-679aeeddc6bso1824430d50.2
        for <ath11k@lists.infradead.org>; Mon, 19 Oct 2026 00:42:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792395748; cv=none;
        d=google.com; s=arc-20260327;
        b=kLUv5mTcGhq37VgtbtKGDIcht4MURThGHbGWFfLlq0QDQ275Jyu2/bVNQacjAwjX/9
         GlCorhw8rM8EfDq1AYl6bp1E+XIczhpkA8lUnBAp9tgKTb/DuBx4b/10eGvKoG5XotrL
         OpN6HlYDW8lgBsJF8P2HIvXwKNp8Gwu7MadnQRIfmq9NnqGHst2iNv8QBtNIx+L8L/9A
         PKWeNMKuBNe4WWPutI6Uh9k/mPsG8iOS9mCV3YheHXlMmuByonGcyud82A2yiA454G21
         4uYgZNbOJ4x8oh6nOxC9s1AwEXRAwpV5TdDbQrRrUjJhkE09B4ovEPp4zaVlb1fkvU5n
         fomQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=UgudJ0WI4oNl1UfszSq5K5yCfvW/TgnZ/aoECPr1no0=;
        fh=CH6cEeOaNltfFMzo0HxdT8Cyy2mF7fPzV0lQGQNJYXo=;
        b=JycJg6vxLgmN7D+UkhlrqV+iwDD9AeJzskXvy2JXOmYlUPdP9wIlD1nWD1RYgftkyr
         41K+Vy6kjGYQu6+heX42ckBeAbji643tX69O9FLzQb5B+gILSlQcO8k24gA0yFJ5izrs
         lK+D8uFSo/EJEZFV4+aqDrWZLlyPyLNoG1JtDyBdNEC0mIiFruIdcRGZfGhD//e2xXEh
         QS6Ug0HEVH+MvKrrJ66hWYYz+zg7kT+x6GFv1tlEIDmr8bx6RxAv3PMROaqmttFkpL+8
         Wbynzz06sO5Imi5HQ6c+CGawYKqI3qfXLmXU2y2tY/CYoGGVtXxwQLuM4XbuNU83urRR
         5JIA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1792395748; x=1793000548; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UgudJ0WI4oNl1UfszSq5K5yCfvW/TgnZ/aoECPr1no0=;
        b=xg19BuM6BvsjHF139RSJytIadGjJLj3X1k+8XFFlSDIJg/zTiYFXu7CPEzXUFpIruo
         +1yoJcCnzBdOJZ3Ulk0nbGzE6GD/2naWMZS4ShGFg/7W15iW/dcP9T8wb6SxQlitzFsX
         aAvexgBnFZXY/xh5QmaeIKLaXNwMe/dfpyFflg1rBzudCHhv9UOa2NM5DRmW9K+/xZKH
         /JC51conMCc4216UKXp1D++kWMnS+p2ADMTzocBu/2cBaK0opy95lML4bAr7ugvx+KL+
         NTjG7X0Ac/mBNdvtQC3fMO6qxXA2MrfJO3t4OFUtSD/xTuRxZPA7Lu35jyOdOVKntopG
         3u1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792395748; x=1793000548;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UgudJ0WI4oNl1UfszSq5K5yCfvW/TgnZ/aoECPr1no0=;
        b=HYOuUZcACGAyzftkrk7YMmgPsXr5ugLoXIbabvylrdRTjYon61Cq/jw6+yBfzs+pQQ
         9MjHOC/bvKps7zKsF2F5ItVmN9pqLsyVpWGPH39n+sqiCXQTJzsTrH09kVcOV5dJaheg
         EuROVMuiEIG9GHA0Utqfg/vher2Nv5irXAkSQyuGxDexQ113rBgOgrZ5fe9JHmkA1hDQ
         KgLyqNFNSXwJ9/bdEAUN3vYZFtScS5Fym0j2cxJwvk0QncTTysDvN5JiRdgmEE0VxMls
         osnaZyM4RwUbr1YR5awXhnNTvqEKmGLmgsxkXSIYnUGDWSgYz287W81G3EFTwH7XbsYG
         AEMA==
X-Forwarded-Encrypted: i=1; AKwUvBxvj/JRwTxfx4nOBwLZBcr6BUTHpHK0kzo7vz+R2Nr7zEqlen74Vuxp6Uo76oZlxeiApD4hE9c=@lists.infradead.org
X-Gm-Message-State: AFq9FYKiOQlnalTAr0jcUhELOOVTLpSSm0Uncvu72OTwvPffD2YwNY5H
	dwmofsOIFELI64w7C69ysiOxxMCbCATPh/KVwP4Ur/e5bo9M5KeWWflo33s3ML+5AfmGGMvVJK9
	OpRACw49sadYfvuuUUAej5H55BhqfvIZ7RzxrBBc0
X-Gm-Gg: AYBFou0njR7cbJ7EjtU8dvX6ERHX0uzciSD8fq8ZaTB+6lsJi4tEHVzCJGw2ZiGI0fZ
	/UjULwHRHq86KZ632calj+vnC4RX1fT1J1PHUwsA8ftVjK/gv17JmDixEQqiSVp6Mr+yhcYHVmg
	BJwc7IRRTYhwpvV7Mb2wdR1Adkl+rlBDvfFNpanHc+W4sMiNPBKqr+LPeTjwwVRv4YteUl8ex39
	2VUyVpI2FbSbLjFDUmDXuts2AmoJFP+BOocvFke8uqFrPlY0W2ByDZQLGq0UHpG36rvwwJbSSP3
	dGk9LhVyTbfxfFbffybVh10827YTSO9idI1LiGOXA2nppgoA6rkAkMkq6R+TE0+SjEXqmKha3Xf
	O853tobHuKqO9wgNZnZmJap3X7yrOM61JolmFhaXz4rTR1FjgL/ZDH3jLz0wouOt2JZy1CE4M2J
	DFOKoQrzx1FJwgugXklSZR8Tp9XrWdQi8SmXXR+Px7k6t1kXrCY198so/ZnRlboYalHlmSlPZSn
	Q5uv2X/uM3nLRx3m8biq4SmWyoE4SSUGeptNAlzG6du3wtrowQjGv9G5Itd/lhfEPNMTCAhiWBe
	amqMxetvcVliKas=
X-Received: by 2002:a05:690e:e84:b0:679:8bba:3200 with SMTP id
 956f58d0204a3-679ca7aa86bmr1822026d50.38.1792395748396; Mon, 19 Oct 2026
 00:42:28 -0700 (PDT)
MIME-Version: 1.0
References: <20261018171803.1545946-1-julius@bairaktaris.de> <DM8MPWZ7TFEE.11W2Q780HK4FT@gmail.com>
In-Reply-To: <DM8MPWZ7TFEE.11W2Q780HK4FT@gmail.com>
From: Julius Bairaktaris <julius@bairaktaris.de>
Date: Mon, 19 Oct 2026 07:41:52 +0000
X-Gm-Features: AclHuK8hH8s9UhWNUS2-04GWjMo-KQMgMTX8POhMSkdKvor1YvD5d8cNyp89uvs
Message-ID: <CAC1t37Kw86_eb6nYxG-hHwuL7ynKYFzauy1j5Q5n8FU7Bk883Q@mail.gmail.com>
Subject: Re: [PATCH ath-next] wifi: ath11k: report TX retries in station statistics
To: Nicolas Escande <nico.escande@gmail.com>
Cc: jjohnson@kernel.org, linux-wireless@vger.kernel.org, 
	ath11k@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_004230_053084_7847B367 
X-CRM114-Status: UNSURE (   5.67  )
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

Hi Nicolas,

> There seems to be a way to retrieve this info directly per tx completion:

I checked the links and the way I see it the WBM transmit count is per
MSDU, so A-MSDUs inflate it.
The PPDU stats count MPDUs, as nl80211 expects so i will not switch.

Thanks for looking into this!

Julius

