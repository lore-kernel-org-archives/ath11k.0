Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 520AA606B786
	for <ath11k@archiver.kernel.org>; Fri, 30 Oct 2026 21:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hbYpxu+Y;
	dkim=pass (2048-bit key, unprotected) header.d=karpenko.ca header.i=@karpenko.ca header.a=rsa-sha256 header.s=google header.b=czSz81Vc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=VD5yToGOxft/iAlbljIC7sImw3W+GTcv6yvpKGraM1E=; b=hbYpxu+YmMmFaKXlpwjRt92L+B
	jYEnXejzFsyq157mtFCTRhqwwWVpvMwueIVFY2kh8yvctMMuk1MpZyenFltrYHQXzpvC9GaIAz/iP
	aB8v1AVEvDg3hcIrJMTU+lOAalB//qub9xxeecvT9I3caqlcsxU5y8yA/d0hlxOZz3qujJ51Yhg/4
	Elk38zIDzSR28uidUkAVV7yO6NmGfRMPznEyEbzJzXcvDvYzrKNtYfwUiVxNfd6BWJy/WZdTLeCjw
	V1ihRFzQUVAqXiiRlUJe4f9CA8xlPB3ZGK7B6YYlCAkr9+ulfNYXXY+xqPkDgjAdEZcp5GTGLsc1N
	sVSAl10g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMu5X-0000000CbaW-1AEj;
	Fri, 30 Oct 2026 21:24:39 +0000
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMu5V-0000000CbaC-02uX
	for ath11k@lists.infradead.org;
	Fri, 30 Oct 2026 21:24:38 +0000
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-49e08af5fd4so541113fac.1
        for <ath11k@lists.infradead.org>; Fri, 30 Oct 2026 14:24:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793395475; cv=none;
        d=google.com; s=arc-20260327;
        b=P4BLZ/CW3mxGfl2DqMdVjyuSphX0wmB1T1hR7EBQQ0kQEIigF7VVbZZMAkZIH9uA2Y
         PUfXxD8V4r8xYvG2DuNsHTxnsPBvTat3KYMDlwyqTE3BuKNoQE3evpcTyQWEM5iYklCz
         9V/HOcuDt0FU8wMlxcgsK2Cc8IFZ6p5BDEc3H5nmWa/dZKM6NfIP7Sb/ZvPB720FvJvD
         OwgXHVre1OCyoVUfQHlj61fKoEz7K5EmsiwkBxKtP/jR+YFgdfXvb+ZS50muc2GW0RZI
         NMFoy0UTqTrb+Bbo3ks6TRFsmvT3t6q6/yvwXOooIIoBHhOXGxIXmhEWKfsDLS3KKXqf
         gYJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=VD5yToGOxft/iAlbljIC7sImw3W+GTcv6yvpKGraM1E=;
        fh=4jkMva2oprAKxuInkc4lNGygjtHDZXv8TmWWlCiAkg0=;
        b=A7WVnf104KjWizRltHWZh810mrUyiRNGT39WlamTVWIu6xN7npqR/XC40o3qrG9bFe
         aVyez8uZQv6yTGQsOZ8M/+IQsrm28GWtIMKafIJk4oRJD2M6gLLLC+aJyhmRO74hHrMO
         uq3sB15dP8w4KHvj78wtvA78Kf0HAte+ch13gSaK+KJ0Hj2h5BusCpmxGIYXiEOe/Wst
         uF07v3rKXT9arC4gtV0M+9CWNIJM08TdRQm+9Bpf0qNgmDMlJtQl+lj+VwYAFDhWMiEd
         2LD/DAOMid4uD00t1SK+2DRR4a9fQ8SW8HgChK7TzrtVKb/B+2ay+r7qGtMfmVvrEsHx
         +mLQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=karpenko.ca; s=google; t=1793395475; x=1794000275; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VD5yToGOxft/iAlbljIC7sImw3W+GTcv6yvpKGraM1E=;
        b=czSz81VcUTahgbE9U9OroqLspxF3/GgL//glOSME5ep7DkZOGdVohPUQzdhYN9QkGa
         aM8EEThe2mQh5u8lc+85Kao34vacCa+EE+1D2W9Bjv60U2PGt6Dui02fO8roxEGJEFbd
         s2cpvb/cj95rBD6yeiz0H1xRyhk08nx6Pew59+zFoMZO/N3BKQhppF3q7EnK1pkrqkGv
         8X+DowJMQXpTgFfpgQbTYk3plqn3PAiC58jbvh8AxIdhPIgnQZPKJiJyEfTFBkZvuNxg
         AUn5uo5WPeuaJl6nHgUlgom8Fz00E6atz5W67aJ95OAiuwzrq9ubqjEj9NogyJH/tik3
         FAFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793395475; x=1794000275;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VD5yToGOxft/iAlbljIC7sImw3W+GTcv6yvpKGraM1E=;
        b=JLKWQmYmGI6IH3cp3PA/MM7q8HqOAlspRLhcaj+wBp4ydC69nMtX51aPGBwena7oEg
         bCCp5cVyXIGRCJS/ssQtJedaD8QvMr9UW8j4umFzYbowzhzu1TkV0jEd/Fh/n+UNeLEj
         sTTRXl20HnvkAqvd0Wtefl0SznhYkkVgtqfrNjjHzysEis3BL7hp/1OnANlhzNhSgMIM
         E64/rOsE6oVHcEVFnZjUukl3K+1YJdCT6gRSqA73Ls0wJ3y9fLsfJPRQw8nnpOxlC/rK
         8TQiPTsB3+Q8qE6bnF7O4WY+JjC9aX464EDuJ8vKLSNaFsKHrS0LkbDgssvKluEbKqFI
         fu6A==
X-Gm-Message-State: AFq9FYLzXRH1VdCiL7odBeZfec2he4tFP/qWSJUDzDHNsDn0n2YHv6kq
	rOUm8kA3H7jtw+t/CJfEEPYD5U1Jwgx/wS8g2fjwvLBPUy2XhuvV7sm2pg7+qrAKGbdB/ap/eLm
	F/EurioQrW1h0tgBzYuMRLcPZFOrMUAzu3uBs9eiRL/1ie3EAUgcX8f0=
X-Gm-Gg: AYBFou1J8L3hynUg9q4f5Jh02Uz+/0Uc71h2ilHrD+lM+tEdBfqcYtxpdXb4v7e5Xaq
	3jPh1qPswp2QsPQjJ+GZWXDy7aKG84qh48ZRVqqC8LgjHuIXxGnHfZIZdwC9csUQeMQBJJc1nNK
	9kwzCnywv70dFYn4kMdsEzW2OWuSD80MtJALpb7y8WpxFwHE6EBg/3gnu07cfV+DDdPf3Gghpmi
	koPueLbhfUqo7HSOvIGE5zIUyIE26OAtCLQdXUj5Xj14UHPucj0lXTfb/M20/sLPZWevXwZ3YO+
	/IsXTi08i4D04nb3EdG7J2FoIkbL7m/2JDQcAW9QpmRZ7z4ztXKSVSL765EcL4hTSOpwUxYi1XY
	LHK5synFqnsRaPH0SSJwd3CL/oACFac5UU8VkGQCl3Q7PF1JUE4WS5QLoirxr9RboM2OtwxkHDb
	Uwi6JAv86yixlCKg==
X-Received: by 2002:a05:6870:d3ca:b0:4a6:942c:7b05 with SMTP id
 586e51a60fabf-4a9076f991amr2445401fac.32.1793395475309; Fri, 30 Oct 2026
 14:24:35 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
From: Alexei Karpenko <alexei@karpenko.ca>
Date: Fri, 30 Oct 2026 14:24:24 -0700
X-Gm-Features: AclHuK_LC0lC8hHw_UwEONtzcp3mlVEURddifkSfuchxQbiy1tD1SUIUgYTw23g
Message-ID: <CAOHMRc8bR13o3BpkMbBhs44TpQYbjTUQsoah0xvtB5-Yo5fd_w@mail.gmail.com>
Subject: [RFC] ath11k: firmware RX cache-clean range
To: ath11k@lists.infradead.org
Cc: jjohnson@kernel.org, linux-wireless@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_142437_073567_8B503546 
X-CRM114-Status: UNSURE (   3.52  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Firmware: WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.41

RX refill clears descriptor offsets 0x50-0x5c, but cleans only 12 bytes
from descriptor-8. Dirty writeback can overwrite hardware-updated status,
including msdu_done.

Proposed correction at 0x01500fa8: r1 = #12 -> r1 = #104.
This covers all cleared attention words before buffer reuse.

Could you incorporate this into the firmware source?

Alexei

