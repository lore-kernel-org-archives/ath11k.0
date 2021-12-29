Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A620BC433FE
	for <ath11k@archiver.kernel.org>; Wed, 29 Dec 2021 14:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ESjJLMRlrRwO6v0OgzgKhFbh5XhnpqH5VNGfnypNF/A=; b=clOhsS0SXNkCc3J0k22rdehwp3
	wB8o2nzOrPOeyacbDT8sCdZM0bULlb803yrjBesugOmsGYzDENwC2jLP/0QIHOmo7MhLmxVVPuf+M
	EQmsYGfdHIuT5M8RTNIjbwIOtB6QCBdQsJOD+Ns7hf9L7w4S7xhMxURTpIeZ2zBa/LBz4cx5ib33H
	wA+qtPtw5an6tYVYCNgufCqTYXRtReJWjIxV8NBiyGAUKXMMZedPcbu7KSMlhDorVaHI9vZusCWmY
	NTjInnEBLowDk+C8R+UrV0VyvsvSWtDykpsircVa4W7Vrt07tyRsx9dqHi29yNQwHL+fLs1K/71OT
	qMUPrQxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n2Zdg-002uDt-2j; Wed, 29 Dec 2021 14:09:12 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n2ZdX-002uD4-IN
 for ath11k@lists.infradead.org; Wed, 29 Dec 2021 14:09:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640786941;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aO/4Yp6T43XLmNMDQP+OwTqaYv7whlIlyBDq4dbPFsg=;
 b=Rz1EyjzOz4stlCddCkGwzylJbd25bYYKZ/OmnJpjaLMbKTUHunpnOusTy4ioya6A245Upg
 xWNrF5l/oO+wyOH4moq8RhEReE9aRMFuF+12trvIW/YjIUydBHoqihcGPhf5mMLmhK3nFS
 +HCcso2hiwH/ydCyXAVAXaD/oCUnNTs=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-365-c6LbMawPOouE1wsnhBa7IA-1; Wed, 29 Dec 2021 09:06:35 -0500
X-MC-Unique: c6LbMawPOouE1wsnhBa7IA-1
Received: by mail-qk1-f197.google.com with SMTP id
 bk35-20020a05620a1a2300b0046d2a9b93dfso12790530qkb.16
 for <ath11k@lists.infradead.org>; Wed, 29 Dec 2021 06:06:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=aO/4Yp6T43XLmNMDQP+OwTqaYv7whlIlyBDq4dbPFsg=;
 b=oFJBzukILf8/MTsvy345ZtQWIRRXtl8d35oC5Z4a1Q1WE28eueaArkdx9eydTAn9CH
 GAHikqORL8SSh2Etm0nQW3vspJ/v3V/nWJHaZrLGgDSy6iyU4hbKHyh+4evA0bMmVQJQ
 iJYxrqujA/ntzHwIjxqeApMmt/yrv4J9xcyNd2DDM2f9O2yONe99YSOC3n+R1BvCfzZX
 cVdjyygY7gRWDo8+9O14gRjUaDgwW4sdRcQogwDLe/Du0rNooOzlzNYkiUSHWH5lOaNl
 x0rXyj6fRIvVeDizUChWSUVMIzl+1h+WuTj84ktLds/rh5c+nbnQHMXbZE9qzvSv7eIY
 cUrg==
X-Gm-Message-State: AOAM530eFZnU7f7Ay4IfPTcDeBdUgTymw5Y8mYHCWlekjxKUPujrxIlT
 AYogDE+pIXJPX7nIhUqBbwdSg/Zt/wIct5yt18iv1r+4xQ30TkAJfgCnvlfM4FVZ5q1LeYKy2HW
 B+HGFfuyOOEVAXFTEUQs+zw==
X-Received: by 2002:a05:620a:4003:: with SMTP id
 h3mr18549166qko.153.1640786790517; 
 Wed, 29 Dec 2021 06:06:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyimHrQiLRtzxiuwvtJVztliA6HApJnsXsaqWdLb9ltPripN76oNC87N68Zld9IushfHCBQfg==
X-Received: by 2002:a05:620a:4003:: with SMTP id
 h3mr18549076qko.153.1640786790152; 
 Wed, 29 Dec 2021 06:06:30 -0800 (PST)
Received: from steredhat (host-87-10-236-9.retail.telecomitalia.it.
 [87.10.236.9])
 by smtp.gmail.com with ESMTPSA id h2sm18124352qkn.136.2021.12.29.06.06.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Dec 2021 06:06:29 -0800 (PST)
Date: Wed, 29 Dec 2021 15:05:57 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: ast@kernel.org, daniel@iogearbox.net, bpf@vger.kernel.org,
 netdev@vger.kernel.org, Marc Kleine-Budde <mkl@pengutronix.de>,
 marcel@holtmann.org, johan.hedberg@gmail.com, luiz.dentz@gmail.com,
 dledford@redhat.com, jgg@ziepe.ca, mustafa.ismail@intel.com,
 shiraz.saleem@intel.com, leon@kernel.org, ap420073@gmail.com,
 wg@grandegger.com, woojung.huh@microchip.com, andrew@lunn.ch,
 vivien.didelot@gmail.com, f.fainelli@gmail.com, olteanv@gmail.com,
 george.mccollister@gmail.com, michael.chan@broadcom.com,
 jesse.brandeburg@intel.com, anthony.l.nguyen@intel.com,
 hawk@kernel.org, john.fastabend@gmail.com, tariqt@nvidia.com,
 saeedm@nvidia.com, ecree.xilinx@gmail.com, habetsm.xilinx@gmail.com,
 jreuter@yaina.de, dsahern@kernel.org, kvalo@codeaurora.org,
 pkshih@realtek.com, trond.myklebust@hammerspace.com,
 anna.schumaker@netapp.com, viro@zeniv.linux.org.uk,
 andrii@kernel.org, mcgrof@kernel.org, keescook@chromium.org,
 yzaikin@google.com, nikolay@nvidia.com, jiri@nvidia.com,
 wintera@linux.ibm.com, wenjia@linux.ibm.com, pablo@netfilter.org,
 kadlec@netfilter.org, fw@strlen.de, ralf@linux-mips.org,
 jhs@mojatatu.com, xiyou.wangcong@gmail.com, kgraul@linux.ibm.com,
 steffen.klassert@secunet.com, herbert@gondor.apana.org.au,
 arnd@arndb.de, linux-bluetooth@vger.kernel.org,
 linux-rdma@vger.kernel.org, linux-can@vger.kernel.org,
 intel-wired-lan@lists.osuosl.org, linux-hams@vger.kernel.org,
 ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 linux-nfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 bridge@lists.linux-foundation.org,
 linux-decnet-user@lists.sourceforge.net, linux-s390@vger.kernel.org,
 netfilter-devel@vger.kernel.org, coreteam@netfilter.org,
 virtualization@lists.linux-foundation.org
Subject: Re: [PATCH bpf-next v2] net: don't include filter.h from net/sock.h
Message-ID: <20211229140557.cuap5jjqz47yevda@steredhat>
References: <20211229004913.513372-1-kuba@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20211229004913.513372-1-kuba@kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211229_060903_693648_53EE6EB8 
X-CRM114-Status: UNSURE (   9.23  )
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

On Tue, Dec 28, 2021 at 04:49:13PM -0800, Jakub Kicinski wrote:
>sock.h is pretty heavily used (5k objects rebuilt on x86 after
>it's touched). We can drop the include of filter.h from it and
>add a forward declaration of struct sk_filter instead.
>This decreases the number of rebuilt objects when bpf.h
>is touched from ~5k to ~1k.
>
>There's a lot of missing includes this was masking. Primarily
>in networking tho, this time.
>
>Acked-by: Marc Kleine-Budde <mkl@pengutronix.de>
>Signed-off-by: Jakub Kicinski <kuba@kernel.org>
>---
>v2: https://lore.kernel.org/all/20211228192519.386913-1-kuba@kernel.org/
> - fix build in bond on ia64
> - fix build in ip6_fib with randconfig

For AF_VSOCK:
Acked-by: Stefano Garzarella <sgarzare@redhat.com>


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
