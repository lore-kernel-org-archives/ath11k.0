Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 793A6CA9EDD
	for <ath11k@archiver.kernel.org>; Mon, 12 Oct 2026 14:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PMfChKFNMXJzKzjmxiF7G9lPkPYxthEBjqQbKUTksMA=; b=Swabi7UVEIwFwTrKzrT58yTJRr
	PhKtUBWIrE7AUDeL2gSLsLY+AzcpKY/YOHZaRSiY/B9+Mdp0XTUISmVvkjQMZNuHpbRgzONyNqij2
	7A0nLIXa+vXwnrQXEnYXO7pCOLQCgSTL3Km9DlZRcjXhZUNgmpscETUtZP+davB2K17GOa5bKdD/g
	11/DJWDB+wf783yEkPgUnLicIbByO/mR4rfjjOT4noYZYUnDSOEjQEyR6zu+ysjtUe2DgjOwQBl7p
	UnB5p3wIfhibZxV6FGH9oJWZqEaygQQmaGbjTYAN32Au2Ps60uRXw/IHkWmMDa1KGAnpZwezcnls4
	64pbGIjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGHKV-0000000AirZ-0tX7;
	Mon, 12 Oct 2026 14:48:43 +0000
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGHKR-0000000Aiqo-1ZGN
	for ath11k@lists.infradead.org;
	Mon, 12 Oct 2026 14:48:40 +0000
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-5337fb43c16so22311371cf.3
        for <ath11k@lists.infradead.org>; Mon, 12 Oct 2026 07:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1791816518; x=1792421318; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PMfChKFNMXJzKzjmxiF7G9lPkPYxthEBjqQbKUTksMA=;
        b=kJTfstjwD/do28YQB8VcfS30164cDpkd0v9tEtnbzi3z0lpePs2rQ+E2Ne/JTJULOs
         TMQ+Dk+UamP8hVwuFM7fplc/rvmOMjOw6kBiOpJbyPOguDPN2X2Q6nYybY3z8/SvJNWF
         1gsbuEk/gE5VxQfNek75S6PH+ZMFNk3Qp+38nvaCRekW4Zn2zkAR6DqwdKjIfjqfCxnZ
         Qf1+2d++BbrdTqa2dCPkFg34SrbVxzYGKkiLoG/bCaaD4856IDxx1qPdhJYznsx8xh2t
         kZKc7Uv7wdPMtA2Gy2XZOhcI98OFzKJpDiiAgmsqQwFrsOBmyUqOwEpep7egmuonfAtu
         vfNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791816518; x=1792421318;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PMfChKFNMXJzKzjmxiF7G9lPkPYxthEBjqQbKUTksMA=;
        b=qH8VPIyLzxBnvOCHnZghn09hDuElGw+8R4lxslWGi0dwmGDvROeeOsAwWt7gQ0Yp27
         bVuHpg2nUT3CWEYjrBIXgwagzadN3UciGJbnLIdpbL0G71by/57T78So5EW3tdFcRHwt
         BscbWMEBFjL57iFLfrsHRthLROuwf9/8+zHf5RvA0VBhNnCWdZ4SyfHh0XDz5AIHwTB9
         ChBIOSRmPqfYlrdLnYoqCC2HB2i6aG4FmvJNP1jNm8h3lH+RkoeXD2rQRywhJ32EfvrJ
         zqBdhLBbew9dW4rpxbl7vtZYCUTxZBd+hi/dx8oUMdpSiIQOmG34mDKL7qIREILQG9CK
         Jucw==
X-Forwarded-Encrypted: i=1; AKwUvBxl/Am1piI1SN7rZLGlLd9EPBRMb7fvGVq88Bxo7HKMdXWYa4jMjZQZJ8UgJC1mmUvpcyGEfDk=@lists.infradead.org
X-Gm-Message-State: AFq9FYIRhLTzfJT7L5KZ8c4kEGiZeOR+j08f2/pO/lD1fOrRdQ9zihVb
	5DOqSLikmVtTAiaJ8H/kooZa3j1bScNJFkzYBcsX/t0SOPp39AB3axFsFyWjd2dmStQ=
X-Gm-Gg: AYBFou2bey8asiiPe5Gok8m2EJlIT9QmMfCJkgUEHzt2lwSYggZGps2OEAFK5jCkLng
	VMmurw/YBm0NIGmfbsA6UCNC5SbaM7EWb9S0G7PTToSz71joSI6zLNh7sjViawQQ4mPksQoB1Dl
	GqZgrurtJo2OTye0ubGYvRI5JWkHLtlcEsrJq/4+mhfgpFtqYir1focVxqMvbYZLR8kYmw4NPjD
	y+rGSPTTtScSJPm3R52F/lF6fZODn1oyLG4TG27b9DIgg2FxjAowGNk7tSt7rPvExV4+79DNokA
	Wg2NsIlPSK5oWHuTb7RhJKGhLR47fLvkoNE976NajEfhKXeFzXSX41yxS9hmS8J/NKS0Cq+hJtt
	x236PJbWcoLtQm06x1cR68Jth1BSE9GpEbTn4zCF/s4j2R3Jbf8YkXU8c9xjHPYNur5NI2mruC3
	zP/YtlmAxfIBIgJsTTFY47V+RSS9fz9AKPLnDhm4pfNvrn89yE4uGXBg1FeMjDyhdvBgxucR4e/
	d6AwZ30Toie9mdzJ7jYNjE+vZ0h2BoBgrcQJ07vZw==
X-Received: by 2002:a05:622a:4d93:b0:534:b7d1:cd1c with SMTP id d75a77b69052e-5359f498f75mr175097251cf.8.1791816516771;
        Mon, 12 Oct 2026 07:48:36 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5359b6fa173sm80625631cf.7.2026.10.12.07.48.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 07:48:36 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xGHKN-00000006Snm-0vE4;
	Mon, 12 Oct 2026 11:48:35 -0300
Date: Mon, 12 Oct 2026 11:48:35 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>, alex@shazbot.org,
	bhelgaas@google.com, jjohnson@kernel.org, johannes@sipsolutions.net,
	mani@kernel.org, yishaih@nvidia.com, skolothumtho@nvidia.com,
	kevin.tian@intel.com, linux-pci@vger.kernel.org,
	kvm@vger.kernel.org, linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org, ath12k@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/7] Enable Qualcomm WiFi PCIe passthrough to VMs
Message-ID: <20261012144835.GG14213@ziepe.ca>
References: <20261011074514.515894-1-jtornosm@redhat.com>
 <b1a3f755-19e3-407e-b8f8-b494de83f59a@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b1a3f755-19e3-407e-b8f8-b494de83f59a@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_074839_407990_F47F50F1 
X-CRM114-Status: UNSURE (   8.13  )
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

On Sun, Oct 11, 2026 at 11:22:26AM -0700, Jeff Johnson wrote:

> Thank you for providing this level of detail in your cover letter. I've raised
> this issue with the engineering team in the past, but I've once again raised
> the issue with your in-depth analysis.

The main issue here is the driver can't use a normal MSI-X in the
normal MSI-X table.

"private" MSI registers don't work for virtualization.

Jason

