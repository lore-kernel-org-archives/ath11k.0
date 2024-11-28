Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41FA7D66BAC
	for <ath11k@archiver.kernel.org>; Thu, 28 Nov 2024 06:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n2sl7DBRBj5Zmz6ctNu6EcUwAGJvkhaL3L7D0PuR0LU=; b=NlxpFHpeHQrKwUCzOcrFWBp8kW
	Y96NSYeO+RYa6RvnWXdSLg5L1Z9SQF2HqLity0CmHMmGPtzs7hUhk+jXD0JL8KImHYetFBSDrerZl
	RN0kCu57nubyTIjuxt9xLWsvt5dVx1lbsrrMawxwrJsBVTYavSBflYW11QBHjTSvumhSsIWHXERTY
	9seC5fNXAJxLjULzxltpu4ajFKohktqKkIaithbnCHvlE9493iEX8DC6t0KZFbkJ2kYQnF3uhR/Gk
	lMlw9vKxhyxxSe+l3+Dcku9R0j33NXNZu90McIIOB1O7OuUvyvBLzW3MRKsKewfFWI5shXiuElvDw
	Jijoa4gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGXil-0000000EmOF-28La;
	Thu, 28 Nov 2024 06:09:47 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGXij-0000000EmNm-16I6
	for ath11k@lists.infradead.org;
	Thu, 28 Nov 2024 06:09:46 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-21260209c68so11029215ad.0
        for <ath11k@lists.infradead.org>; Wed, 27 Nov 2024 22:09:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732774184; x=1733378984; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n2sl7DBRBj5Zmz6ctNu6EcUwAGJvkhaL3L7D0PuR0LU=;
        b=XxEfmwDlm/OtaS52g2Rs2G5kR6Npi09pAu8TtvrO90IJqBxpG8Gnhi8ZoIJRm+SQe2
         knQfJR/rSVrMdijNzo6f3BZvBwkMtGtR8Kr5dPzHCmEmgqWKBLqZlWpb2zFBvYg1rsVr
         vkjB+wgaj8IgU+PzqpO+pTCGF8vtF2dWj4d3TH9SPgnMVD7hRBn/JHN6dm/osSZ1YSyn
         kR/VVNfIvnWJakWeH5/mZmxpVhKVetxxmr/TvndKZHv4B7z0jfaZXRpOetdUwvSdEhNK
         t2MtGcg/7KMgnSNVvYU1oHCinfwX0aATqoGpmB6M8KVSyksSnN+VRwhO6QvLbefcIHwe
         oU0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732774184; x=1733378984;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n2sl7DBRBj5Zmz6ctNu6EcUwAGJvkhaL3L7D0PuR0LU=;
        b=TYUiz0qI5+YI6uHMkeJAmZKE5VOBJBbA3psNez2ysQSzpr6KBmuWGQeIdsn0lZggRL
         J+9JhFBm89iIpqLv7p8yrqJOI3FlOSJqSWbTOfl2VvZjVWIhS9Oq0LjPNIVuyazXtJjQ
         Bbg6VyWBf8Lf5AFRATctV2HdHeBOmtmopYI2e75QWUC8NoU4rmadRYM/5R1GctXj5beM
         vk//IlKBXvVhohUJMs5vfKa2vMQX40gmfI6dptl2CFRrbDKiiBpazfEKBqEWkbtAXVVQ
         cagotecvru8/GzID0W7ckFI32AINR4+2h2SpGEL2tPgyOHr36CQeeAEahHwDozT5i6vd
         dggQ==
X-Gm-Message-State: AOJu0YzCPOi9mpjmzxAzW4ZqgSa9J2EHiT+ZAZeJHx3LOZXJTeJi49yo
	TvGGi6EOIy6VYFKDsjNr0c509G/rt7MRdwFke9slMMByOwcWpBYi
X-Gm-Gg: ASbGnctXA9qqLMsNOQ+CcHbcYEPXtNK71X9Ui3lAft6PGtJQ+wlLff+8LQJ5BYFAsRf
	L1ONF07GStB7OCmzz7Dc9Ln+clHHPq3Gdo4jMxy/ugp1hKLKSO8U7Pfl3Tl4a/V9ajB+ya4Mb6C
	EesCr1zsa6w6zrBG2esPJzUHDb1/5guyeGdXa19bZedeySpR227K8Ek3mpfZax+BVVCEyYwMyat
	cGfrrnY/0qW5XDbWj5irGJN0/K5cgcOWOAij5H19Nze3+mVvtAGtjOTmko=
X-Google-Smtp-Source: AGHT+IFZPjyCmsQWAiAm+6M27f4qo+6s3Q2xz+nj6OTaaxFwdNlTWRqmmwWrbADa4Y/wOn9Ajf8AmA==
X-Received: by 2002:a17:902:ebc4:b0:205:7007:84fa with SMTP id d9443c01a7336-2151d870174mr34999085ad.28.1732774183312;
        Wed, 27 Nov 2024 22:09:43 -0800 (PST)
Received: from LAPTOP-SQ5KB8RN.lan ([222.249.179.118])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-215218f479asm5642875ad.41.2024.11.27.22.09.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 22:09:42 -0800 (PST)
From: Baichuan Qi <zghbqbc@gmail.com>
To: quic_vthiagar@quicinc.com
Cc: ath11k@lists.infradead.org,
	jjohnson@kernel.org,
	kvalo@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	markus.elfring@web.de,
	zghbqbc@gmail.com
Subject: Re: Re: [PATCH v5] NAK
Date: Thu, 28 Nov 2024 14:09:31 +0800
Message-Id: <20241128060931.94100-1-zghbqbc@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <f0077f4f-922d-56b1-a5b7-bb01e4462e87@quicinc.com>
References: <f0077f4f-922d-56b1-a5b7-bb01e4462e87@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_220945_300307_ADC10DA4 
X-CRM114-Status: GOOD (  13.67  )
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

Thanks for your reply

The reason I submit this patch is that the current 
`ath11k_ce_rx_post_pipe()` NULL pointer check does not ensure 
that `dest_ring` is NON-NULL. And it is not clear to show the 
filtering of tx ce pipes

> This does not really fix any real issue. Please check ath11k_ce_alloc_pipe()
> where initialization would fail if anyone of pipe->dest_ring and
> pipe->status_ring allocation fails for ce pipe used for Rx.

When the driver is running normally, the results of the 
following three are equal:
---
(pipe->dest_ring || pipe->status_ring) // current code
(pipe->dest_ring && pipe->status_ring)
(pipe->dest_ring)
---
However, when some errors occur and `dest_ring` is abnormal,
the OR operation cannot guarantee that the pointer is NON-NULL.

> This will always fail as the caller loops through all the supported ce pipes
> and ce pipes used for Tx will not have either dest_ring or status_ring.
> Please ensure the patch is tested properly.

I tested [PATCH v5] and indeed the wrong return value will lead 
to wrong results when the pointer is null.

Please refer to [PATCH v4].
Link: https://lore.kernel.org/ath11k/20241127114310.26085-1-zghbqbc@gmail.com/
Although it does not return an error code, it can ensure that 
when an unknown error occurs and causes the status of 
`dest_ring` and `status_ring` to be different, the subsequent 
code will not access the null pointer, which will only 
cause the driver to fall into loops.

Thanks for you read.

Thanks
Baichuan Qi

