Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FC55C47077
	for <ath11k@archiver.kernel.org>; Tue, 16 Jan 2024 15:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iJ8kDv4NT77wbV/RUW9AhIRHKupbHjNRdeQr3Ppsnl0=; b=t3Fcs7vHjvsViB6QWIagJCj77A
	YqI5zoe1yPuxO2d/JncCAlR58oQsf4fmJLMn3zEdsf8ckKpdjJlu6oPUlMaAcsL0BJ/RJUbXwj5og
	Pfw4hLCzIhYSSWFGDAC7TPkdtQai4IChj7ZJWNNcA4auW3YThHFHtidEeqk/KHYpjC23rkOjtV07w
	gKVtX+T5xNR0q6iUxgFMU0F2LU8Wyg5zf/4p9v/rOQUmfHezD3tbXcbVJU6V78RnfB8YuU9lQ8zqx
	zQlANmFglomKEWK/8dD6bUvEo4rjkpwaZmwXtBN2fjBrcP6mTPHDKDqHCuhI3pAv6BX6BWSg0RlYp
	VbdbUGAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPlOe-00CQfO-13;
	Tue, 16 Jan 2024 15:30:36 +0000
Received: from mail-oi1-f179.google.com ([209.85.167.179])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPlOb-00CQdh-1z
	for ath11k@lists.infradead.org;
	Tue, 16 Jan 2024 15:30:34 +0000
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3bd87b652eeso489240b6e.3
        for <ath11k@lists.infradead.org>; Tue, 16 Jan 2024 07:30:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1705418969; x=1706023769; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iJ8kDv4NT77wbV/RUW9AhIRHKupbHjNRdeQr3Ppsnl0=;
        b=J4l8QmGKGpIbtBS+/TfhMSqNLNUKLcPnKGJ/xg7OB0nSAPBn+fvrvl4p55a7ia6fqX
         Xai2iT5m/UOjcW9npyd7e9pgDxNOYVXmOUEpXsmxnq7yb2qJI5h1MmcHHNHy/3KUtcsk
         3SHwGYIvJwp2vV5dwcuz+wXLtO5vFjNyGWJ4/UA0eM3UQg6NWGNG6RVLOWRCnD8c5gMM
         Oa8uNE3LSrinotRpKKZxowqgD5kRmHkVIUT0D6lAfjR8MdX36MsRVVP+MN+p6pZ2B9q5
         WO4gYeXXTTcjMW8fXHvBh1WhUAxVLaBSnL6mbGEfNxZmE+HZ1mumpdDh50yHtldSOetw
         5FZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705418969; x=1706023769;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iJ8kDv4NT77wbV/RUW9AhIRHKupbHjNRdeQr3Ppsnl0=;
        b=PMheFteA+rlTsFxMphLqGyFLrsqWVXjAF2SVMGKXGzyYSvCnTGbLWh/YNksbdTdXtR
         VNHwmZwlypKVTKO8S9rXiHV/OKYNtDHQujCzWcfqvl9Qm6eB2wdkusijQ2gICw5M7gKX
         SyrAIceejO1VqqTR6ZMTeB4tmayEx1exLIbl0yWcCKJyT7oJ/QuNXSDLQUKWzwYrUuWp
         Tg3lfX06IFGha2naTdzCAcdggIIAZSkrNGPB2z8+YHpvflhigcxNBf4tmbSS8qp09/Kk
         xO/t3/EJFOZXdAsEBnHUG7xtA/QZwRH1vYFzBavGwsH6GRrOHwZYgY0k+w+qU6IM7kHa
         GZag==
X-Gm-Message-State: AOJu0Yz0mfKUeXuhr3LYIT/fgu5dEvpHea3YqOMX+B2H+yT9eCyQqlu5
	61Gt1ZuLc/toyO9ICCl++XdLwfVh2bpI8w==
X-Google-Smtp-Source: AGHT+IGBWdHLHlu+WKmrXxmyfAaya9jZa+J4uJQ5YBat9EhQgRdlPfVABfpR7u3rUy/Ip3xt+opsKg==
X-Received: by 2002:a05:6808:2e91:b0:3bd:72dc:65a6 with SMTP id gt17-20020a0568082e9100b003bd72dc65a6mr3757509oib.58.1705418969400;
        Tue, 16 Jan 2024 07:29:29 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-68-80-239.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.80.239])
        by smtp.gmail.com with ESMTPSA id q16-20020a05620a0c9000b007815844a295sm3800321qki.116.2024.01.16.07.29.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jan 2024 07:29:28 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1rPlNY-0045nl-7f;
	Tue, 16 Jan 2024 11:29:28 -0400
Date: Tue, 16 Jan 2024 11:29:28 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Baochen Qiang <quic_bqiang@quicinc.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	Kalle Valo <kvalo@kernel.org>, James Prestwood <prestwoj@gmail.com>,
	linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
	iommu@lists.linux.dev
Subject: Re: ath11k and vfio-pci support
Message-ID: <20240116152928.GF50608@ziepe.ca>
References: <df9fd970-5af3-468c-b1f1-18f91215cf44@gmail.com>
 <8734v4auc4.fsf@kernel.org>
 <e8878979-1f3f-4635-a716-9ac381c617d9@gmail.com>
 <285b84d0-229c-4c83-a7d6-4c3c23139597@quicinc.com>
 <4607fb37-8227-49a3-9e8c-10c9b117ec7b@gmail.com>
 <3d22a730-aee5-4f2a-9ddc-b4b5bd4d62fe@quicinc.com>
 <87il3w7zjh.fsf@kernel.org>
 <20240115104658.0b56bd35.alex.williamson@redhat.com>
 <543d9d2f-e132-4fdb-8454-68595cd20515@quicinc.com>
 <57d20bd812ccf8d1a5815ad41b5dcea3925d4fe1.camel@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <57d20bd812ccf8d1a5815ad41b5dcea3925d4fe1.camel@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240116_073033_655264_D9175F77 
X-CRM114-Status: GOOD (  17.08  )
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

On Tue, Jan 16, 2024 at 11:41:19AM +0100, David Woodhouse wrote:

> If we had had this posted interrupt support from the beginning, perhaps
> we could have have a much simpler model — we just let the guest write
> its intended (v)CPU#/vector *directly* to the MSI table in the device,
> and let the IOMMU fix it up by having a table pointing to the
> appropriate set of vCPUs. But that isn't how it happened. The model we
> have is that the VMM has to *emulate* the config space and handle the
> interrupts as described above.

I do have a strong desire to rework things to be more like this, just
not time yet :)

We have enough real problems related to the fake interrupt data in
the guest.

This ath11k thing sounds more like IMS really - it makes zero sense
that a device would be designed where the MSI vector has to be copied
to another location - most likely the other location is another
interrupt source that can be programmed independently, with its own
irqchip, etc? Linux supports this now. Thomas and Intel did it to
support SIOV IMS.

Are you sure you have implemented your Linux driver correctly? :)

Of course IMS doesn't work in VMs, but that is a big motivation to fix
the irq organizing. At least you'd know why the device is broken :)

Jason


