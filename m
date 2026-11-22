Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D83D606A31D
	for <ath11k@archiver.kernel.org>; Sun, 22 Nov 2026 20:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BQLoOZ2Y;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=b8mnOV3V
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=kMg+zjgW2qcP+kPRWz/Nw5zZ3eqt0jtFvOR/PqTH4zY=; b=BQLoOZ2YDMsQaU
	xl+T2w1LxweoudKTYCdDbax+RICL+lYIFToc59DX25+owEzBnCmGCZvxe5eiFXFD/FYXUuCnQB+WT
	v9Nye4c8g+cMIjwREKuZ65/JcU57VWsfAZ/vO4jXxL8XCX6A4yhV/ZibhS/Y5FBa2RsTc7dDZvWN4
	1CFec3XDKILWpRLl0cp6+SO8HCqB83U9hm5WNqjPZSLEbFhzBzI0Fqa8jRh7bqamDTWOINxCqKVYk
	LX2FrQDBqSsh3Mot4lqsGzy+wkQehkHKczojJ110YH+wObXVg3hOrW3sroTwvD3ZwVH60BvCpw0EM
	Ic02j2PZoQo7CCjJP6pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVELu-00000001jQw-1WQL;
	Sun, 22 Nov 2026 20:39:58 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVELr-00000001jQC-240g
	for ath11k@lists.infradead.org;
	Sun, 22 Nov 2026 20:39:57 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-6b587538a37so3823785a12.2
        for <ath11k@lists.infradead.org>; Sun, 22 Nov 2026 12:39:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795379993; x=1795984793; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kMg+zjgW2qcP+kPRWz/Nw5zZ3eqt0jtFvOR/PqTH4zY=;
        b=b8mnOV3VYqiNxxe3rRTbecLtfsABSprkSaZTmVwomA0ZAZySjqzt3F1ntDjMog4Gd1
         uSYvY/N2Flj/A16ZSNNCxy/6DwF5IcEulLesjsDkqRE6Ej5XinwKM8kBDq30QuYu5Y+H
         9PnpNYfh7lLcA7rP8mnmks8lEOj0HexXZ54NSFDWSn4iSxn6VhUB+6Ho97ZYmVJKE0DB
         ztnixogUgfWnrzjM8gRkyxZGY1KllG90IAnRvC14w5f5usE2NvDahKNsSySKnfZB9CN4
         IrEToM4Y9MoFUtFf3IvVTv+RvIZnblf7y6QmGygLHQWDFVIl2+19/11m+Ce7zvrp1xx6
         pVPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795379993; x=1795984793;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kMg+zjgW2qcP+kPRWz/Nw5zZ3eqt0jtFvOR/PqTH4zY=;
        b=PH4DJRE3CiOF2ixu3OEFz1KY0zEU17kzdpLhJDdfPSdZecvkWOHx0Zf9WOi5JNQ9iW
         jG8EO8+8wA0MVWBXKo3NhAJ0P+g0E50bmA+GJ+vwmwKFwfKer6+26NcoqWc60m6MEuIf
         GUSOe+aRLWa5uQUzBCQJeebwvF2zYMwicWCZnOAY/jHIfYg6Hbe4Icn2LHPMt+MptvHa
         B19N0YTuBVG6hJ5VLI4xj+XFogV3H3FdQmMvnp3n/YhecoO27VYEsHcq3zs1VAE71nXk
         be+jiNtoXEpw8IXM8LUEyjR77q+FU/Z8zevhn1uZc7fbako/gPcrzV4wzKextg+7eT3Y
         yKRA==
X-Forwarded-Encrypted: i=1; AL+hErFrVb/VSXixc5/7pQNLnImJAGQg9vj4x6H6+8atR3ASKCHL2AlW8GdAejsnAKe2LeAbZ+HD98g=@lists.infradead.org
X-Gm-Message-State: APuU4Z8Rutzk5HJlUn4iw7CSNJ+t9sE0F2mJUrJp0aVobyhK8H7Xgpka
	7QTIBFPThZjOQdjgGQ4yQfa5LhFxOQwHiOkJBCGJrSoTm84lgCzrdmxTuSTwW103HA==
X-Gm-Gg: AZFdTZeSCoMLbTUKEFvo4SpWAytdj0U7eNQM1k2X1ZYdzOvC2QHhaWPzOxSt29Pz7RD
	VUDsqeJWoOrp4aheZpaDZGKmdO4BN70p4Jt4GN8oruQea+FDMdqJHgCPZA3AwvGVOtfda1Q/a7/
	XnCbVMJjO1p72YJvzxEh8hoF/mUjQDFaZAr92JT1WiyoB5giq5lMG0NWyRS+yMSusdvAYhrV/jE
	Mg/jpd7EJu3OvbRVqUhk6uaX17o9053bPHpmQmaFPVUEaXEyJfvPQJMl15takvubU35UQOXRQhe
	Fy/1jke6xcCWJNCxhLMpnfpcHbV5OWT6AvAYDbOiTXXVvgCvbAfLeZSbTLNddlt9MEyeaPTAJRw
	8ReOCu8Vaj3AAQoKUjlLhaCvWZ5NjZuHTb+CwvQEo74XVvPDs4JFzupsRC5ySzHKDfdbacm1uiW
	ReVwHg++tYlBjPa0Jj3WflUu74AO3FenNK8Gq35GwAodJqfGRxJpbZEJdPB5THG9be+5+BKpWzC
	n4n5fJMAzjH78Taast6k9KQz87c3haO6EPU7drR4qBGiCWuDVVKC76ee56iH2NfJbdmIC84lNCj
	H5N4+bhlxHHL3sHCuxtwQjq2QNPKR/bm45qu+6ZfpaZ+LxkFDwXAD/Ou6DNNrFQNimNp/uY5xpj
	gZCskQ343vXqAcuhXGuic7QliTE81r85hMu+PWJ66ImrsR7DubKCHFFmxvDQVxkRw2BhSnm7fUb
	pGqZXeAD/iFsEd4GFZcpmjcflrsgILRQvB+5udB4gpAtrIbONLVYFgYIu7muwG9uulG7WOucC0i
	kb9wtNhiXI85IMwpW/4oxCINlZxfIx9kbFroJmENVr9nyDEc5weaePfqSIxRiv3MmEvt8tAf3ly
	NPp/js/KlYpHZAy3NgZbjeMANiDlqrqn688PxqUEi8e7rIqhUhx3Ff3vnHSqO8ZYMJMXTPu+4f2
	Z
X-Received: by 2002:a05:6402:1e8a:b0:6ba:b1fd:6e6e with SMTP id 4fb4d7f45d1cf-6bab1fd70a4mr818185a12.31.1795379993206;
        Sun, 22 Nov 2026 12:39:53 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f24713cc00a54ea2c7a4b07bd3.dip0.t-ipconnect.de. [2003:f2:4713:cc00:a54e:a2c7:a4b0:7bd3])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba36e355easm4295727a12.3.2026.11.22.12.39.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 12:39:51 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: jjohnson@kernel.org
Cc: rameshkumar.sundaram@oss.qualcomm.com,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org
Subject: Re: [PATCH v2 0/2] wifi: ath11k/ath12k: apply the 160 MHz NSS ratio to the radio
Date: Sun, 22 Nov 2026 21:39:53 +0100
Message-ID: <20261122203953.1830745-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <c1acfddb-2132-426f-9a23-472d8339dadd@oss.qualcomm.com>
References: <20261021165138.388593-1-julius@bairaktaris.de> <c1acfddb-2132-426f-9a23-472d8339dadd@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_123955_566117_2061E9D9 
X-CRM114-Status: UNSURE (   4.40  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 27 Oct 2026 21:09:19 +0530, Rameshkumar Sundaram wrote:
> Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>

Jeff, the series still applies to ath-next 1983b40acfcb. Is anything
missing before it can be taken?

Julius

