Return-Path: <SRS0=2hxC=FW=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 905D4C4361B
	for <ath11k@archiver.kernel.org>; Fri, 18 Dec 2020 19:41:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1FD8522D01
	for <ath11k@archiver.kernel.org>; Fri, 18 Dec 2020 19:41:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1FD8522D01
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=eero.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=028rFw08L8KegXVp15v+zV7Y0I/zJjhY6apuUptfwQw=; b=J1mOOpwW6V/BwW3Y2h413TcxF
	t/7SlEGG2PR/iai0D6EgcajTruznj0+tdgdvU1EYqjPMjzgjRhNS9tYR707qmUHLzSS9LGHrsBKsZ
	2PaPILQerxQwvZz4F/JAdBd2qSs117Z6esgvAakJ1SLvfDMyy0R9ni8ECqNtkzJoGanNqjntwwauA
	JbkCa/lEfnYARpQaNVcvr/Kt1way/zzjAhg2UEdTW0dSLB6kmgK2jCndSiTLN/hCKoVnpwED+1Qn8
	QXdczz9q7FPPK0DDyagZVd65pqn39AqGuZIOAs3HCPgE8MwYUFp0vZDdpqNOUJTwLWkdSTiPkL1k2
	N80WEfctg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kqLcu-00076b-TT; Fri, 18 Dec 2020 19:41:20 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kqLcq-00076D-OW
 for ath11k@lists.infradead.org; Fri, 18 Dec 2020 19:41:19 +0000
Received: by mail-pl1-x62a.google.com with SMTP id x18so1934338pln.6
 for <ath11k@lists.infradead.org>; Fri, 18 Dec 2020 11:41:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eero.com; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=vTy4lGI2YMOaU1LOo0Ca6YZry6iYpOtB7i+T4PcUg2A=;
 b=jCD+aFVXazJo5/FhYwoWM3l0xL0kvfh0ugtyXkKHKIa5RClOjr8fF3M3sZPZIKQ7I5
 8VMQGDfKQenTp6asMQQozGJ0crsWIYdxQ79rDRhtVXL9m8w6yKcKMhya/kU5hyZWkGqy
 9fHcyZKt/hofJ8UX259DTH0TtPhPg+ppG5s9s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=vTy4lGI2YMOaU1LOo0Ca6YZry6iYpOtB7i+T4PcUg2A=;
 b=CpOxKnfAFcrUj94MFAUeLeLyiXBXHET4IxNv4DXZ/VX8Hv/6JXXhVAbYmNd5e18BV7
 8ZyXE4ymy4Pnxdu5K+JazgSNmIBzvoJgONPBaCJB7/en+OMtKk2MkBxOFVazkiqwPhco
 vxPj0nKyFXdbd2ioo20QuRimQJc5Syr49F0igMKhH1uxYIvhkIlJ8IxXQkZSD5OVCMqp
 wWSb5c2S/fSJdrjA7txohF1mUfjnyn/F7dsoF/hUs0j8ETqtke1vP5NeLwSewmo9joca
 /ltZqPfU1gSbqUHmpq+o/c6SZ+4vIuxcTouO0Rgc8SXafngjoPF6tXpdQyLEKHAO9qoX
 A4Wg==
X-Gm-Message-State: AOAM5331nw5e4a6lBxnidfnyEQtQsna8wayHqe11hXXKP+GtBdSvKi4o
 ZSlhgCl61PPJPVXsqXOMVAIYYg==
X-Google-Smtp-Source: ABdhPJzZmHAG60xEF3boTBFWTd5yANVIY0z9bPwBum2DqZKzVQHxPDNsRxHwQMYQTbHxI61M4jpr7Q==
X-Received: by 2002:a17:90b:4a4c:: with SMTP id
 lb12mr5762615pjb.162.1608320474608; 
 Fri, 18 Dec 2020 11:41:14 -0800 (PST)
Received: from [192.168.4.200] (c-76-102-118-9.hsd1.ca.comcast.net.
 [76.102.118.9])
 by smtp.gmail.com with ESMTPSA id y69sm9285068pfb.64.2020.12.18.11.41.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Dec 2020 11:41:14 -0800 (PST)
Subject: Re: [PATCH] ath11k: Update tx descriptor search index properly
To: Karthikeyan Periyasamy <periyasa@codeaurora.org>,
 ath11k@lists.infradead.org
References: <1608305041-21946-1-git-send-email-periyasa@codeaurora.org>
From: Peter Oh <peter.oh@eero.com>
Message-ID: <09bbb2fe-6e1c-9faa-232c-74b5a3a1e71d@eero.com>
Date: Fri, 18 Dec 2020 11:41:12 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1608305041-21946-1-git-send-email-periyasa@codeaurora.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201218_144116_926962_B615D32B 
X-CRM114-Status: UNSURE (   9.05  )
X-CRM114-Notice: Please train this message.
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Cc: linux-wireless@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org


On 12/18/20 7:24 AM, Karthikeyan Periyasamy wrote:
> Tx descriptor search index field should be updated with hw peer id
> and not by AST Hash. Incorrect search index causes throughput degradation
> in all the platforms. so updated the search index field with hw peer id,
> which is a common change applicable for all the platforms.

Could you be more details under what conditions you observed the 
throughput degradation?


Thanks,

Peter


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
