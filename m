Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F8FBC6FA8E
	for <ath11k@archiver.kernel.org>; Wed, 21 Sep 2022 10:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8rWer+2QSsZwAHA/uMxJ4cclI9+hhxCcV5e/JPq5ML4=; b=HdqtuaS3BSp3p0
	eOzoMSkS9WTErSOrbm5FcAB4yyJeWri8o0dH2ogfMc8cvpiYEL3NJNzTWQyMqrtqR3/3Nl8GEvD33
	vvRmzNs/FwYAA64eXvU9r3mJGGJhgMk/YKh9AhEkaCpQDKJOvk5oIYE52ZlBvfY6rb9wolkOqZw45
	CAmrK4xGjP47xxFaou2JNLu9QJ/ySJ1Kot+J1t4ha+I6V3P0B2nf2nwoZdbPnM+yJzwrzNc6f86mV
	+m+AMWERber8p+hVXaikarMr13w0K1jhjaqdKwJ0gTaljeeQXoHerw7Bc0Gwwxk/tecyka7vR3sok
	s90bVPdYuNFPECp3FLdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oax5B-00Aszy-VP; Wed, 21 Sep 2022 10:35:57 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oax57-00AsxK-0I
	for ath11k@lists.infradead.org; Wed, 21 Sep 2022 10:35:55 +0000
Received: by mail-ej1-x633.google.com with SMTP id u9so12639976ejy.5
        for <ath11k@lists.infradead.org>; Wed, 21 Sep 2022 03:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date;
        bh=vWTx9waxxwXRcamt4ePCJ74t1njaL9ZrGOeuhdI5nro=;
        b=s3/zWeZf0K6JlcMz68yA4amBwBVAratLAs4TitSGSWrUF7jSEaercPgB435AdKIgST
         sU8Cc96EMdJuaaW/RujVYHjga3Tr8y/70utRZgnSsbQzEop5DUn23X2gDJCY8SBXHfb1
         ungajh15QI0Y7prHu+d6033i8RFixVFx3TmgGZsO43LhbV3MPeT96iQxUOjeVIr/3VD7
         qzFQDhqSNN8OlLHWogZut17ZNQJVSkz70x03KufUaYFQQxgSKZlSvLx9K/HImbSUblo9
         xajMFezGzHdmBMQlx7t5faxa12Fq5yMrTEJ8Ajo7QGcTvLQQtqcI08BvazMyGk7078ET
         ZYTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date;
        bh=vWTx9waxxwXRcamt4ePCJ74t1njaL9ZrGOeuhdI5nro=;
        b=iOoS82KdXakYk5BBvaayHbcI3oOxoflvOOyWKezkPgboTNAlAfulxS1ohdz3OLbFPv
         CCu9lBgojqB3JW+RTVgU3hEH10rVp+E+YFyF88sy2QdCVoojQG6wc7n3SLlMMSzzwMFq
         XM3fjP9LI0nQ8AK2pj+7OtqBK3EF5GEaWar5R9rn1DBg1kh4AqVnoosu9jgJbfTfSD+I
         Vq3we0bVRaD4mAqep5xvMatij3FCV8wUhLOBL3Y0v+XQvn8y74s0BNBFFwH31OXoYJPw
         ZxtVqX2USOCzA2EuVvnfqkQhGBRgpdpBaTzka3lDqEBTUPhn8xnJ/l4Y6CDibEXyvzIL
         RC+g==
X-Gm-Message-State: ACrzQf2oGSwWiqXfZ8lwv8cq4QxYIjbxCqm37Tpo2ltCmkjftb3ZwHMv
	wcZoY0MBM3IHQqyap26NCRHciBVESkhrvnLTfUqI6NAnS7MCEA==
X-Google-Smtp-Source: AMsMyM6GsnvJLODMjJ0WjzFJpNLKJiNkDrnFRW/CCvYMgJEzL+qkZOkteO9eA3X5swG3BfiW9LgeeqdRo/NsYE3W/2w=
X-Received: by 2002:a17:906:4fce:b0:780:e1d8:eacc with SMTP id
 i14-20020a1709064fce00b00780e1d8eaccmr15423597ejw.366.1663756550698; Wed, 21
 Sep 2022 03:35:50 -0700 (PDT)
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 21 Sep 2022 16:05:39 +0530
Message-ID: <CA+G9fYsZ_qypa=jHY_dJ=tqX4515+qrV9n2SWXVDHve826nF7Q@mail.gmail.com>
Subject: drivers/net/wireless/ath/ath11k/mac.c:2238:29: warning:
 'ath11k_peer_assoc_h_he_limit' reading 16 bytes from a region of size 0
To: Netdev <netdev@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	linux-wireless@vger.kernel.org
Cc: Kalle Valo <kvalo@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	ath11k@lists.infradead.org, regressions@lists.linux.dev, 
	lkft-triage@lists.linaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_033553_086332_9C1CF344 
X-CRM114-Status: UNSURE (   3.87  )
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

Following build warnings noticed while building arm64 on Linux next-20220921

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

In function 'ath11k_peer_assoc_h_he',
    inlined from 'ath11k_peer_assoc_prepare' at
drivers/net/wireless/ath/ath11k/mac.c:2662:2:
drivers/net/wireless/ath/ath11k/mac.c:2238:29: warning:
'ath11k_peer_assoc_h_he_limit' reading 16 bytes from a region of size
0 [-Wstringop-overread]
 2238 |                         v = ath11k_peer_assoc_h_he_limit(v,
he_mcs_mask);
      |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/net/wireless/ath/ath11k/mac.c: In function 'ath11k_peer_assoc_prepare':
drivers/net/wireless/ath/ath11k/mac.c:2238:29: note: referencing
argument 2 of type 'const u16 *' {aka 'const short unsigned int *'}
drivers/net/wireless/ath/ath11k/mac.c:2019:12: note: in a call to
function 'ath11k_peer_assoc_h_he_limit'
 2019 | static u16 ath11k_peer_assoc_h_he_limit(u16 tx_mcs_set,
      |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
In function 'ath11k_peer_assoc_h_he',
    inlined from 'ath11k_peer_assoc_prepare' at
drivers/net/wireless/ath/ath11k/mac.c:2662:2:
drivers/net/wireless/ath/ath11k/mac.c:2251:21: warning:
'ath11k_peer_assoc_h_he_limit' reading 16 bytes from a region of size
0 [-Wstringop-overread]
 2251 |                 v = ath11k_peer_assoc_h_he_limit(v, he_mcs_mask);
      |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/net/wireless/ath/ath11k/mac.c: In function 'ath11k_peer_assoc_prepare':
drivers/net/wireless/ath/ath11k/mac.c:2251:21: note: referencing
argument 2 of type 'const u16 *' {aka 'const short unsigned int *'}
drivers/net/wireless/ath/ath11k/mac.c:2019:12: note: in a call to
function 'ath11k_peer_assoc_h_he_limit'
 2019 | static u16 ath11k_peer_assoc_h_he_limit(u16 tx_mcs_set,
      |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
In function 'ath11k_peer_assoc_h_he',
    inlined from 'ath11k_peer_assoc_prepare' at
drivers/net/wireless/ath/ath11k/mac.c:2662:2:
drivers/net/wireless/ath/ath11k/mac.c:2264:21: warning:
'ath11k_peer_assoc_h_he_limit' reading 16 bytes from a region of size
0 [-Wstringop-overread]
 2264 |                 v = ath11k_peer_assoc_h_he_limit(v, he_mcs_mask);
      |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/net/wireless/ath/ath11k/mac.c: In function 'ath11k_peer_assoc_prepare':
drivers/net/wireless/ath/ath11k/mac.c:2264:21: note: referencing
argument 2 of type 'const u16 *' {aka 'const short unsigned int *'}
drivers/net/wireless/ath/ath11k/mac.c:2019:12: note: in a call to
function 'ath11k_peer_assoc_h_he_limit'
 2019 | static u16 ath11k_peer_assoc_h_he_limit(u16 tx_mcs_set,
      |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
In function 'ath11k_peer_assoc_h_he',
    inlined from 'ath11k_peer_assoc_prepare' at
drivers/net/wireless/ath/ath11k/mac.c:2662:2:
drivers/net/wireless/ath/ath11k/mac.c:2264:21: warning:
'ath11k_peer_assoc_h_he_limit' reading 16 bytes from a region of size
0 [-Wstringop-overread]
 2264 |                 v = ath11k_peer_assoc_h_he_limit(v, he_mcs_mask);
      |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/net/wireless/ath/ath11k/mac.c: In function 'ath11k_peer_assoc_prepare':
drivers/net/wireless/ath/ath11k/mac.c:2264:21: note: referencing
argument 2 of type 'const u16 *' {aka 'const short unsigned int *'}
drivers/net/wireless/ath/ath11k/mac.c:2019:12: note: in a call to
function 'ath11k_peer_assoc_h_he_limit'
 2019 | static u16 ath11k_peer_assoc_h_he_limit(u16 tx_mcs_set,
      |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
In function 'ath11k_peer_assoc_h_he',
    inlined from 'ath11k_peer_assoc_prepare' at
drivers/net/wireless/ath/ath11k/mac.c:2662:2:
drivers/net/wireless/ath/ath11k/mac.c:2264:21: warning:
'ath11k_peer_assoc_h_he_limit' reading 16 bytes from a region of size
0 [-Wstringop-overread]
 2264 |                 v = ath11k_peer_assoc_h_he_limit(v, he_mcs_mask);
      |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/net/wireless/ath/ath11k/mac.c: In function 'ath11k_peer_assoc_prepare':
drivers/net/wireless/ath/ath11k/mac.c:2264:21: note: referencing
argument 2 of type 'const u16 *' {aka 'const short unsigned int *'}
drivers/net/wireless/ath/ath11k/mac.c:2019:12: note: in a call to
function 'ath11k_peer_assoc_h_he_limit'
 2019 | static u16 ath11k_peer_assoc_h_he_limit(u16 tx_mcs_set,
      |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
In function 'ath11k_peer_assoc_h_he',
    inlined from 'ath11k_peer_assoc_prepare' at
drivers/net/wireless/ath/ath11k/mac.c:2662:2:
drivers/net/wireless/ath/ath11k/mac.c:2251:21: warning:
'ath11k_peer_assoc_h_he_limit' reading 16 bytes from a region of size
0 [-Wstringop-overread]
 2251 |                 v = ath11k_peer_assoc_h_he_limit(v, he_mcs_mask);
      |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/net/wireless/ath/ath11k/mac.c: In function 'ath11k_peer_assoc_prepare':
drivers/net/wireless/ath/ath11k/mac.c:2251:21: note: referencing
argument 2 of type 'const u16 *' {aka 'const short unsigned int *'}
drivers/net/wireless/ath/ath11k/mac.c:2019:12: note: in a call to
function 'ath11k_peer_assoc_h_he_limit'
 2019 | static u16 ath11k_peer_assoc_h_he_limit(u16 tx_mcs_set,
      |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~

Build log: https://builds.tuxbuild.com/2F4W7nZHNx3T88RB0gaCZ9hBX6c/

--
Linaro LKFT
https://lkft.linaro.org

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
