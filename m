Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC8A9C3ABBC
	for <ath11k@archiver.kernel.org>; Tue,  6 May 2025 16:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=le+RGOEXf+PLjSVW04iEzrbaCc2v/k7AHP12FCt1V0Y=; b=E6TOQJd5OhLQHyQZMZihWr6iWH
	UZou3Z8SgqzgxIBJasx0PU5r9sYOAE8i2zppkiDlPft+NrZwelxGIwH/LGjVU9HnBWQr/JgE0kEu9
	HQz0yUKgjCaKbe84FPCHxlmGV/cvBxfN8Wf6sEeLIXFfoID79Zvr2ifgYBVJQjsXYOQ8FD824T4V3
	pwXdhUmi5PqCV5RkKd5isunvytw25gm+sbtvqhLJ8DuCUJ0ksjY5VLN5lJxRaCpwdgFfdGnAwyLQL
	DRxd7TW/F/YsH0+0jmuAMe2i2MymQpU4R46h/KZkrmJSwpoEF6N+zstmyhGb/OqXcc0QjBd6V+owj
	8Ran3fCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCLVC-0000000CkLI-05hp;
	Tue, 06 May 2025 16:50:42 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCI4k-0000000C2l7-362r
	for ath11k@lists.infradead.org;
	Tue, 06 May 2025 13:11:12 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1746537055; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Mi3wkTw0euUe1uZMnqrVoRQTAXYgJJJpKX+sAdKc+DsIa9D58bptoy+VYTDd0PXgDOyP8xV98/AX/FrMMeFuhd/Kky+4/jkm9g/tkIWUwAnKOfuOPrjGdWHXblqjUTP94ePSAb8itAD6JRgtpEkfiu4sqyMRYV1IctmbHzhFjcE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1746537055; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=le+RGOEXf+PLjSVW04iEzrbaCc2v/k7AHP12FCt1V0Y=; 
	b=T0STJ2kuRkK56z6+ILP8yF7R6fyJKSscrn2rQl9bhUWQwaTFxhdws9qzTGcz046IX1WfjQGFwdl9i5p1r/dStlYcq9BMFslV6EMtQmpi+uYGlJ1E9JEzM2gyxrl38lfpo7wi4pUquPRm7FXvVvO9sbETZUT/S6m2pVPBM+Bcl3Q=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=usama.anjum@collabora.com;
	dmarc=pass header.from=<usama.anjum@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1746537055;
	s=zohomail; d=collabora.com; i=usama.anjum@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Cc:Cc:Subject:Subject:To:To:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=le+RGOEXf+PLjSVW04iEzrbaCc2v/k7AHP12FCt1V0Y=;
	b=dJkQeUSiBYBeRg/Hpa4Cz7IPFuwAeLIk1iv2kmqb3DzxaY4ulM12yl4CsYaRqlKy
	+mFLgkbWqQWWJ5lJOrdMGDDnZMwXoCttV6TMDoxQorJCQ/V+HacA4Uy7nnz87cQWsnC
	p4YG4fAU6WRQKU/qjbxh0xvkd4pBaLq+KpoS9AO8=
Received: by mx.zohomail.com with SMTPS id 17465370533315.429619863376274;
	Tue, 6 May 2025 06:10:53 -0700 (PDT)
Message-ID: <ec0bb100-4a70-4827-86b1-e4a7e8867a2d@collabora.com>
Date: Tue, 6 May 2025 18:10:48 +0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: usama.anjum@collabora.com, kernel@collabora.com,
 linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] wifi: ath11k: Fix memory reuse logic
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, quic_bqiang@quicinc.com,
 Jeff Johnson <jjohnson@kernel.org>
References: <20250428080242.466901-1-usama.anjum@collabora.com>
 <f58075f7-f643-4e47-b774-dc529aaa01e5@oss.qualcomm.com>
Content-Language: en-US
From: Muhammad Usama Anjum <usama.anjum@collabora.com>
In-Reply-To: <f58075f7-f643-4e47-b774-dc529aaa01e5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_061110_812522_A5610AD9 
X-CRM114-Status: GOOD (  11.77  )
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

On 5/6/25 12:17 AM, Jeff Johnson wrote:
> v2 feedback was not incorporated:
> For starters, can we make the subject a bit more specific, i.e.
> Fix MHI target memory reuse logic
> 
> But don't repost for this -- I'll make that change in ath/pending
I'd changed again on the request of another reviewer. Please feel free
to change as you like. I don't have any opinion on it.

> 
> However, does ath12k need the same fix?
Looking at ath12k, there is similar code structure in
ath12k_qmi_alloc_chunk(). By adding some logging, we can confirm if
ath12k requires the fix or not. As a lot of code is similar in both
drivers, ath12k may require the same fix.

I don't have access to ath12k. So I cannot test on it.

> If so, can you post a separate patch for that?
> 
> /jeff

-- 
Regards,
Usama

