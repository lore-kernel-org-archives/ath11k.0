Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC1D8606AD16
	for <ath11k@archiver.kernel.org>; Wed, 21 Oct 2026 16:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Hae/T8Wf;
	dkim=pass (2048-bit key, unprotected) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=Ec/7URcB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tanuq6pdo1p+/CXclZjkrZ4cpxXAXmw+CC7txW8gGPM=; b=Hae/T8WfshY15Gu/R0EyI3mB30
	doJhQEXTxtAWxw+FnfoJIwriwWgD6XKP6k2J62HKNEmSx+FmBXOM4oVDkU82XApvpsnq1gYcZrODB
	z+8OpwTDHUqo+G6cZwOy4uyCcfPhytLIHxYgfvugTjL5NNyT40GNqZQSO5oiGMj78UQ4Ckzj6mdt+
	orTbonL71zohCfhd0f+fdoBVMuwoXQEyvxgAuE3SFzlvmFeu0DzRNVXjHWd6RKcabWjimUpRNfYDX
	2w0+D+WuLrPk0QhjsBJkYfCerarJ7zZcHeeZrtWx5fK+O4sO1yWwxcFGja5mU/P/JHXPl4qzPwTO7
	QZkzcvzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJZ3D-0000000COin-2U4u;
	Wed, 21 Oct 2026 16:20:27 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJZ3A-0000000COhO-2IYD
	for ath11k@lists.infradead.org;
	Wed, 21 Oct 2026 16:20:25 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-c46822eefb6so99367066b.2
        for <ath11k@lists.infradead.org>; Wed, 21 Oct 2026 09:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1792599622; x=1793204422; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tanuq6pdo1p+/CXclZjkrZ4cpxXAXmw+CC7txW8gGPM=;
        b=Ec/7URcBpNDyBH7MZTSP7QR5xVeyKH4A8TLhwEgD1+95pi/gnG2T/WF8nsYkFQEDnv
         NnN5vt1ZfI7DOnjURt48gM2DaOrVleVi/t4C+WG48wr0bXO+d6RltH5ERVoB5eBCVJZ+
         y+ZTz9q/2qlafUj+3Fld5vczd7djOlHpYRetY7bdjuMNL5qHJYj8RGclqvF0wyNMdl7f
         awIg14Uzz3idHEKaHlwhCQpqVrHbl4Cy2JAX6SabKu8Dm9cJFaf5ElWaua15NDe8cXaI
         JctP0D5e9fqSsJZf77kcRKGXfMhDjzQjwRRvbxO1oxpdDCbnBvKbVmHETruT7+1w+0/0
         CMCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792599622; x=1793204422;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tanuq6pdo1p+/CXclZjkrZ4cpxXAXmw+CC7txW8gGPM=;
        b=H/OaRR7NYWeEYuAwiCe27SvCFq9oWfPdd/7crRZlUXQ6sMwunlIrjbn9ktYxu/4lPH
         4WrP5r6vuyJQRsI2vuVKbLfJyBZtCRy9qMCZwnXDDvFEmOcVVeOlI46WRd5BYv0HjTHq
         qBNAdHPlnzcsC9ucACF0b9bClr83UX7L7cVKtFMIxp40TCQPcehqLKOUUngBUKLG9xft
         ay1dv+U+zypl7dUUM9MvqZCzmvrQMybO+Z3SzvV/CX/dQ8YrPaoFxUpEMbirMw2KvCWr
         oamUspqEHSKOyPggNP+vtJjHNOFQDgRPDdHbU6iPSiHcVFT7UMZ6dRswpuxcqF8PXt+p
         Cvjw==
X-Forwarded-Encrypted: i=1; AKwUvBzgnZ5JBFYolZcj0NVep7N4HJPC7x1L5ssAqts6Gn/ZA+KN89RO0V64zu36zdoO+i8i81n9LPY=@lists.infradead.org
X-Gm-Message-State: AFq9FYJDjoeNir71neXQTcrW7naOFkgagWhiXMrgvzZHzyoHaXCVN22w
	Qya1MimVzVapxyy6j2pJ0P5r9108YWuIDfFK2V54gYFqlAgfDwu1jfeo7bZlCcCU08wf8AwXNyZ
	HXZCETrk9
X-Gm-Gg: AYBFou3WSsK4C04K2+tt8tAnFtEdcRDKn11pIfRq/aCzdoeEh5IeaqdERIEXFv63y6h
	k3daX5C5T/8172r/TIu3+x1loqaUnuzeCw+w+jf1dBoS6jCyKrtw8Al16tPQZzDTqrAjL6YUW1p
	Ej/Utdd7OpGYdeqzWNvyrJlRb36E9iUCZAgiTMgsBE3vW+silzJ3/8xvGGRQY2zvoogA2KwNm+e
	x8lABJdHPXtgx4rPpx+8v0lFpst0myVvvGz4nVPezVx7BP7lnwtJ7mlfUu4u8VASVezO46sD17Q
	OxJiJi5WRxetp4qMEwl+RonN8r5Y6LAMSvT8DqxLTaf5rx9jzmp+ghm1awdPm6XfnbXXeOGEgUY
	LRhqtoEBIfcFqdB68n9L8DlwxxGx8dNY/h+6KU9CbL8r2DICetaQMRDVbsrOvRN1ambkhpRv7YM
	Qa9sEp5M2dQ2uIlugFLJ+iJl5KoiiTelHCAbb7LqQ2rDnlyn/3tIbDgYV0GyKWgUODojcTv5Bgq
	cLqMLkc0oUp7MWNXu/e+gPvjnjWnqBTy4Kk/uAGoTCukH+KmfQDFYV7Gpnn5tN1PwdUKxo6qzDV
	n1l7oi4SSwY8QPi1192rR8QAqiVoQwFVoO0O+ieaP7g7svROVRSJIZaC5F6QrPtlaMme2PNe+ij
	TerbDAGTgrLoFAt85z3o6dDxg8vVTC7PbbOj52SLzkLCoOCnNMsXZ+q54CqL+zoOgZJqrWBszUP
	JMMdKHsdDJCbS+V8OHDBJq+JoUvzmpBDd3GMAtB9hhDXrxzgB1+CDNrBJyNUGUAz1Pm+WJW5uVp
	UotT/A=
X-Received: by 2002:a17:907:86a5:b0:c40:f89f:d91d with SMTP id a640c23a62f3a-c467977fc0fmr243410366b.28.1792599622338;
        Wed, 21 Oct 2026 09:20:22 -0700 (PDT)
Received: from Desktop (pd9513e2d.dip0.t-ipconnect.de. [217.81.62.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a59d641sm18138266b.60.2026.10.21.09.20.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 09:20:21 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: rameshkumar.sundaram@oss.qualcomm.com
Cc: jjohnson@kernel.org,
	ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org
Subject: Re: [PATCH] wifi: ath11k: apply the 160 MHz NSS ratio to the radio
Date: Wed, 21 Oct 2026 18:20:20 +0200
Message-ID: <20261021162020.280802-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <b5fc72a1-71c9-418c-95b1-897a62f0c6c0@oss.qualcomm.com>
References: <b5fc72a1-71c9-418c-95b1-897a62f0c6c0@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_092024_610669_91DB7C70 
X-CRM114-Status: GOOD (  10.58  )
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
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Ramesh,

thanks for taking a look at this.

On 10/21/2026 4:21 PM, Rameshkumar Sundaram wrote:
> On 10/11/2026 6:06 PM, Julius Bairaktaris wrote:
>> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1
>>
>
> Fixes: ??

v2 adds:

Fixes: f552d6fd2f27 ("ath11k: add support for 80P80 and 160 MHz bandwidth")

>> Assisted-by: Claude:claude-opus-5-5
>
> The model-specific "Claude:claude-opus-5-5" attribution may no longer be
> required according to the newer guidance -
> https://www.kernel.org/doc/html/latest/process/coding-assistants.html#attribution

Agreed. v2 uses "Assisted-by: LLM".

>> -		tx_nss = ath11k_get_nss_160mhz(ar, max_nss);
>> +		tx_nss = ath11k_get_nss_160mhz(ar, ar->num_tx_chains);
>
> seems ath12k has same issue for VHT care to fix it ?

v2 will have a fix for ath12k as well. I only have one ath11k router,
a Xiaomi AX3600, and no ath12k capable device, so I can't test it; the
ath12k patch is compile tested only.

Julius

