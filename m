Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83852C71136
	for <ath11k@archiver.kernel.org>; Thu, 12 Jun 2025 07:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x3cQxvge1b3pgTXY/P74zyHhUe8/1LHEazQ2unbyP9Q=; b=zq4oJPOSjWASu/iQpqmlCbbypC
	Adz/ACIoVnS4dEfvY/2UTx04rk8dAnAdmoOx7+sM86f2Caig0PxLooR4rj6Ck3N0232iPAjfs6UZJ
	BmJAFcJo9JayJcMFsjfAK9FsZbYUXZWNxEXN3yHIdpUWS3DHhwWDwAS7v3/N5BpEKCBCEVO2nAQc7
	l82VbTPphr+mrjA1MDeRzQe3S1CvLQyG6iaHe8ZUGKalCFwbMaxBzRZWnLM0Qwp84622IiTpauU70
	uLPZ2crq0aCcSYu/i+GtJzIVY08ft/Yj/ZPIEBE6VPUgu+TzI/8naYvmFLJKVzM2X3klfyATgDNYj
	KziqJpvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPcli-0000000CWRC-3I9D;
	Thu, 12 Jun 2025 07:54:38 +0000
Received: from mail.toke.dk ([45.145.95.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPcLn-0000000CRi1-290G;
	Thu, 12 Jun 2025 07:27:53 +0000
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=toke.dk; s=20161023;
	t=1749713264; bh=x3cQxvge1b3pgTXY/P74zyHhUe8/1LHEazQ2unbyP9Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ZoJd1RofjBG3c2KRN9APXC7yxH3qNKPgwDg9QDflTXn2UCDBMYdeHUlTnQkMRhgax
	 HuzjkJQSAq9Qvs2q8Q/YutgomAfDQk4nC6GtPBRvppz43JKq9/2InUl2sQ9HhHHzqi
	 cdZfrEzrSLzDaHWpFZkaPUkhr8WE3C4IX6q5it8UJ76/lcT+O0JcPM/5oCL/kKmwUZ
	 XtMRVhnSul7lBuW1QOysqlimnKwXlmOW4I1Suuu1cZ2mqyh1v4k7ogGAsI8B9zzeK7
	 GPYQtmFJSep4xl2hOH80kBONORtLHt1HIqzf3yHPHyk5XJEUItIxTkyFXiX+ctoiqY
	 H0wuxYVu3o4pw==
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, Jeff Johnson
 <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
 linux-kernel@vger.kernel.org, ath11k@lists.infradead.org,
 ath12k@lists.infradead.org, Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Subject: Re: [PATCH ath-next 2/5] wifi: ath9k: Add missing include of export.h
In-Reply-To: <20250611-ath-unused-export-v1-2-c36819df7e7b@oss.qualcomm.com>
References: <20250611-ath-unused-export-v1-0-c36819df7e7b@oss.qualcomm.com>
 <20250611-ath-unused-export-v1-2-c36819df7e7b@oss.qualcomm.com>
Date: Thu, 12 Jun 2025 09:27:43 +0200
X-Clacks-Overhead: GNU Terry Pratchett
Message-ID: <87h60lbes0.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_002752_008003_3EAFDA16 
X-CRM114-Status: UNSURE (   4.16  )
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

Jeff Johnson <jeff.johnson@oss.qualcomm.com> writes:

> Commit a934a57a42f6 ("scripts/misc-check: check missing #include
> <linux/export.h> when W=3D1") introduced a new check that is producing
> the following warnings:
>
> drivers/net/wireless/ath/ath9k/common-beacon.c: warning: EXPORT_SYMBOL() =
is used, but #include <linux/export.h> is missing
> drivers/net/wireless/ath/ath9k/common-debug.c: warning: EXPORT_SYMBOL() i=
s used, but #include <linux/export.h> is missing
> drivers/net/wireless/ath/ath9k/common-init.c: warning: EXPORT_SYMBOL() is=
 used, but #include <linux/export.h> is missing
> drivers/net/wireless/ath/ath9k/common-spectral.c: warning: EXPORT_SYMBOL(=
) is used, but #include <linux/export.h> is missing
> drivers/net/wireless/ath/ath9k/common.c: warning: EXPORT_SYMBOL() is used=
, but #include <linux/export.h> is missing
> drivers/net/wireless/ath/ath9k/dynack.c: warning: EXPORT_SYMBOL() is used=
, but #include <linux/export.h> is missing
> drivers/net/wireless/ath/ath9k/hw.c: warning: EXPORT_SYMBOL() is used, bu=
t #include <linux/export.h> is missing
>
> Add the missing #include to satisfy the check.
>
> Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>

Acked-by: Toke H=C3=B8iland-J=C3=B8rgensen <toke@toke.dk>

