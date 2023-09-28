Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 666A0E732FE
	for <ath11k@archiver.kernel.org>; Thu, 28 Sep 2023 17:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vrz4q4muYh4L3Y/NTWHhrjQQoOdKN9E3NojCnheSYoA=; b=Zx7a9p2905Us67
	7471ixehyzJ8YOksV8tXY6n1KH16EFBXdtmoUQxA7+8ga92PBgwSA5VMQqeICR/xIEfEhLrFNlTOt
	TSu2BMqqxOoZTjKol4N8I41LfxiJCavZAcK/hF9eZHV4dfLhXIikwKFdUI536+l7+z4Zzs9YvdZ69
	HF36veCyqy8cIyRwc2TYvxCgAK7BqiNvrCuQtfzBBM1MA0TN1wg6XJnZ1H+JqP9k2J/Y3MKBNyPJm
	2YHCMNivCnMa3DyyxI1kCG50rmugbu7qX55Coz7SiTfZWCiXeeC4eKf4cKHAJ+25rZRWRyt6rG2uz
	tPvFZw3kF183eIqfKFqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qluiq-006QAD-39;
	Thu, 28 Sep 2023 17:22:44 +0000
Received: from forward500a.mail.yandex.net ([178.154.239.80])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qluin-006Q9b-04
	for ath11k@lists.infradead.org;
	Thu, 28 Sep 2023 17:22:44 +0000
Received: from mail-nwsmtp-smtp-production-main-54.vla.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-54.vla.yp-c.yandex.net [IPv6:2a02:6b8:c18:3d80:0:640:1395:0])
	by forward500a.mail.yandex.net (Yandex) with ESMTP id A18FF6041D;
	Thu, 28 Sep 2023 20:22:30 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-54.vla.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id TMVMXK3uACg0-tJO1bq20;
	Thu, 28 Sep 2023 20:22:30 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1695921750; bh=CKSzaldp3JpbeHm6oJmpWRnYA1nkbH6WLJrRWMqn9a0=;
	h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
	b=Rfsd10zjlGJIy2ELEXaJMIPG4c/5/r/KMGnEh8fvMb3D60/Zmf5TwRNVTQlC6qX3u
	 WWl/a1FfKTkumJXV1VBYKxHiEVgjYgwFb2QG8TPHJdQpWF97Y2SlaS++BMG2uU0Q7K
	 swJO2O02ipVwD3+XTdvgQlbxO3P5Fky1FETS1rE4=
Authentication-Results: mail-nwsmtp-smtp-production-main-54.vla.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
Message-ID: <30d83337-1311-19e8-47f2-391c5e5bd8bd@yandex.ru>
Date: Thu, 28 Sep 2023 20:22:29 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] wifi: ath11k: drop NULL pointer check in
 ath11k_dp_rx_mon_dest_process()
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>, linux-wireless@vger.kernel.org,
 lvc-project@linuxtesting.org, ath11k@lists.infradead.org
References: <20230907083852.10775-1-dmantipov@yandex.ru>
 <169591601112.3096214.11174520645995155662.kvalo@kernel.org>
From: Dmitry Antipov <dmantipov@yandex.ru>
In-Reply-To: <169591601112.3096214.11174520645995155662.kvalo@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230928_102242_134649_18E8704B 
X-CRM114-Status: UNSURE (   5.11  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On 9/28/23 18:46, Kalle Valo wrote:

> Patch set to Changes Requested.

Probably I miss something around your internal ath-specific workflow
but AFAICS this fix is not needed for ath-next branch of ath.git
(there is no redundant NULL pointer check there).

Dmitry



-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
