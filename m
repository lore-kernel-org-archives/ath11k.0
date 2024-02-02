Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46DB2C4828E
	for <ath11k@archiver.kernel.org>; Fri,  2 Feb 2024 12:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3WrQlKWmTzgxXM9Xq7iWZ37ybL6PQV7GmW6fl32Nxz8=; b=ZRL2mWDXOMubiGLIs/0sc17U0J
	KmsIaVySWpkCdcGZv2WBveIMWqBSBUxwpjk+DZ2RpYe9R9SHc4VMLAMn4YtckLQug7FLa6MbgOCoI
	fX1gWqGQdht1dxvsy7mkUm1spacHZpd4WlY90Tk3xNrYWQtIZFHgDS0KE5DWkEn0NLGINMpYkUIvp
	wK/Y9z+Nm3oj68Bbm0zrb3L/4++T/ksXl2WoIoVe7ROmK27JoycYfWwN3VMdC9XWVh1PtHCH8ka51
	TGb+IfL8JPa9usDpFGRu7sO1JVwZnzS56dJlAZ+wiHWegv0TMP2NqcWwCHM1HRMPVmeCSR4Qk+Ddb
	T7GRDlhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVsTI-0000000BRD6-0cUg;
	Fri, 02 Feb 2024 12:16:40 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVsTE-0000000BRCe-2vGu
	for ath11k@lists.infradead.org;
	Fri, 02 Feb 2024 12:16:38 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-6de3141f041so1509666b3a.0
        for <ath11k@lists.infradead.org>; Fri, 02 Feb 2024 04:16:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706876194; x=1707480994; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3WrQlKWmTzgxXM9Xq7iWZ37ybL6PQV7GmW6fl32Nxz8=;
        b=p4yM2Hjk7pLf3PWpfTtWepGwC8Nn+3KT4goCZseqi5Z2QHsbcheowrCvhtksXNW0lz
         0wAJzybYcQ+aOR3aQZOH8CYr8rca1KFRBVtRPRkdvykwzSvgI/lC9Uunf7BPoNzhAApi
         Hosv8kmPWYbJkAvj7YIFUp8dqGelfOC5BD+w8WenVYpZxCIT6t38Whi82hl7+sfhNZvw
         P0wNnzkmVoDpQgTSyUjBc0TqBMqayf3eOUihspUFcewtRnHSr/hO1WzpbIpI8U12qwo6
         gvy5gQvqfF+qtEfDdxTNAhywLLmuDUJ79vyKk4NbOgiI4AcJkL4TbMKDfUafQYBjJkYq
         iH0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706876194; x=1707480994;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3WrQlKWmTzgxXM9Xq7iWZ37ybL6PQV7GmW6fl32Nxz8=;
        b=YvPUJh8NWzZ8ldmh6ERj2wY3r7E0wBSRTnpNthnd6445LwVqdXBj/bUvOsrl5npQZY
         bhVv3zAUawr0gOkkJlgBNAQ4bgdhPw+t0Mq1NWJlwK90hsAP9iw9zMVTaCx6OceHiW30
         qAhNRut6kQkPtudRF8BDEtpwKrTHBS1fNol5EE6ZuEWedF4XAskyPLIIVfwobzRWh8IP
         cDd+SmN0V8OLMwpDcZRDnn184EhoFj7zQCT4OLUUaYUlYXML9ThMK7vrfJsf2qW1YhKP
         ECWeKfHn9HLyFPiXVfPVPWRvjsYP+4ztVU6bLeeMtMEro9LrpBsQ+XeUNI7oUcDOTq9J
         h0sw==
X-Gm-Message-State: AOJu0Ywt7O05kAhO+nBUNtkHWdB9xv9mC5gYIAhNCT3HPJJGA/pSrKPM
	N1SQZHJAgQR8WSgwkNfVdI2Djau2AY6CcxJuyDQGT5GzhsH+q1CE+FyLHb6bGh9qq0S7bHVxS9Q
	=
X-Google-Smtp-Source: AGHT+IFSwEV2m0Gdmgd6lEedpwK/MfSLND1vfenzThu++22xu2B5azEXkWVeQKf2qKJSz4JPkb0iug==
X-Received: by 2002:a05:6a20:7d83:b0:19e:3c7f:cbbe with SMTP id v3-20020a056a207d8300b0019e3c7fcbbemr6479540pzj.9.1706876194527;
        Fri, 02 Feb 2024 04:16:34 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWIbd9h/zN8zW55YNPgvoxkUt0iVLXCIPcM/ljKjrL3w8GQ/vvoo5s6qZJFJUuatnCU7xjeeTWtjCJ/+6TQew2LXihhqmXW6rmhgxOtd54sMqN9Tu9sJayCep52VVQM/7WlK+NkLmBy9lcoYgWqkKefIxYDPRsDbZg72ZQiE6Cp
Received: from thinkpad ([120.56.198.122])
        by smtp.gmail.com with ESMTPSA id b19-20020a63eb53000000b005cda7a1d72dsm1439531pgk.74.2024.02.02.04.16.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Feb 2024 04:16:34 -0800 (PST)
Date: Fri, 2 Feb 2024 17:46:30 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: Kalle Valo <kvalo@kernel.org>, mhi@lists.linux.dev,
	ath11k@lists.infradead.org, linux-wireless@vger.kernel.org
Subject: Re: [PATCH RFC v2 2/8] bus: mhi: host: add new interfaces to handle
 MHI channels directly
Message-ID: <20240202121630.GC8020@thinkpad>
References: <20231127162022.518834-1-kvalo@kernel.org>
 <20231127162022.518834-3-kvalo@kernel.org>
 <20240130181938.GB4218@thinkpad>
 <d002afe9-3c01-413c-82d2-353db0356802@quicinc.com>
 <20240201100040.GB17027@thinkpad>
 <07668be1-8366-43b5-83ca-bf66d0d8087b@quicinc.com>
 <20240202071011.GA2961@thinkpad>
 <34e80f19-8804-4505-b134-f099e087b53e@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <34e80f19-8804-4505-b134-f099e087b53e@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240202_041636_768311_19F983E2 
X-CRM114-Status: GOOD (  40.00  )
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

On Fri, Feb 02, 2024 at 06:49:19PM +0800, Baochen Qiang wrote:
> 
> 
> On 2/2/2024 3:10 PM, Manivannan Sadhasivam wrote:
> > On Fri, Feb 02, 2024 at 02:42:58PM +0800, Baochen Qiang wrote:
> > > 
> > > 
> > > On 2/1/2024 6:00 PM, Manivannan Sadhasivam wrote:
> > > > On Wed, Jan 31, 2024 at 03:39:26PM +0800, Baochen Qiang wrote:
> > > > > 
> > > > > 
> > > > > On 1/31/2024 2:19 AM, Manivannan Sadhasivam wrote:
> > > > > > On Mon, Nov 27, 2023 at 06:20:16PM +0200, Kalle Valo wrote:
> > > > > > > From: Baochen Qiang <quic_bqiang@quicinc.com>
> > > > > > > 
> > > > > > > When using mhi_power_down_no_destroy() MHI hosts need to unprepare MHI channels
> > > > > > > by themselves.  Similarly, MHI stack will also not create new MHI device since
> > > > > > > old devices were not destroyed, so MHI hosts need to prepare channels as well.
> > > > > > > Hence add these two interfaces to make that possible.
> > > > > > > 
> > > > > > > Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.30
> > > > > > > 
> > > > > > > Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
> > > > > > > Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
> > > > > > > ---
> > > > > > >     drivers/bus/mhi/host/main.c | 107 ++++++++++++++++++++++++++++++++++++
> > > > > > >     include/linux/mhi.h         |  20 ++++++-
> > > > > > >     2 files changed, 126 insertions(+), 1 deletion(-)
> > > > > > > 
> > > > > > > diff --git a/drivers/bus/mhi/host/main.c b/drivers/bus/mhi/host/main.c
> > > > > > > index d80975f4bba8..3f677fc628ad 100644
> > > > > > > --- a/drivers/bus/mhi/host/main.c
> > > > > > > +++ b/drivers/bus/mhi/host/main.c
> > > > > > > @@ -1669,6 +1669,58 @@ int mhi_prepare_for_transfer_autoqueue(struct mhi_device *mhi_dev)
> > > > > > >     }
> > > > > > >     EXPORT_SYMBOL_GPL(mhi_prepare_for_transfer_autoqueue);
> > > > > > > +static int ____mhi_prepare_for_transfer(struct device *dev, void *data)
> > > > > > 
> > > > > > "__mhi_prepare_all_for_transfer"
> > > > > 
> > > > > This is to prepare one single child device, I don't think a name like
> > > > > __mhi_prepare_all_for_transfer (with 'all' inside) make sense, right?
> > > > > How about changing to "mhi_prepare_dev_for_transfer" or
> > > > > "mhi_prepare_single_for_transfer"?
> > > > > 
> > > > 
> > > > I think most of the checks in this function can be moved inside
> > > > mhi_prepare_for_transfer() API. With that you can just reuse the API without
> > > > adding a new helper.
> > > > 
> > > > For autoqueue channels, you can add another API
> > > > mhi_prepare_all_for_transfer_autoqueue() just like
> > > > mhi_prepare_for_transfer_autoqueue() to maintain uniformity.
> > > > 
> > > > - Mani
> > > If we do that, we need to call two APIs together, does it make sense? From
> > > the view of an MHI user, what we want is an API to prepare all channels, no
> > > matter whether a channel is configured as autoqueue or non-autoqueue, we
> > > don't care about it.
> > > 
> > 
> > You are calling this API from a wrong place first up.
> > mhi_{prepare/unprepare}_transfer* APIs are meant to be used by the client
> > drivers like QRTR. Controller drivers should not call them.
> > 
> > What you need here is the hibernation support for QRTR itself and call these
> > APIs from there.
> 
> OK, I got your point. QRTR is the right place to manage MHI channels, not
> ath11k it self.
> And we even don't need these two APIs if change to do it in QRTR.
> 
> > 
> > > And besides, I don't think there is a scenario where we need to use them
> > > separately. So if we always need to use them together, why not merge them in
> > > a single API?
> > > 
> > 
> > A single controller driver may expose multiple channels and those will bind to
> > multiple client drivers. So only the client drivers should manage the channels,
> > not the controller drivers themselves.
> Exactly.
> 
> Great thanks for the proposal, Mani. Will change accordingly in next
> version.
> 

And you can drop the RFC tag in the version.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

