Return-Path: <SRS0=zVFH=KP=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFDC0C433ED
	for <ath11k@archiver.kernel.org>; Thu, 20 May 2021 12:36:25 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7487C61184
	for <ath11k@archiver.kernel.org>; Thu, 20 May 2021 12:36:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7487C61184
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:References:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lgdnWSENUSKB+LyhRXL3fCFH7iHN0/gdw9lZkfAFciY=; b=gxsE9E5HBegbC9CvpTA4XV+IN3
	i8QazrWnOvRVUVwjkuGnpVboI982EKeiWhhxvzb/T+RGlpU6Jfgy/hx48vhg6cxYyGuQf8uRe5VDF
	3U8qodDgdHpobTY2SoL+GNCrQKTbXe20Xj4HNqnb4mzgml+yfrG66xp4BSDXRnXFtIvPG2L+QhGCV
	/LQA/Vc6Ojq90t7ogiEbTLfauehRymFHVMiPsqQQv4AfGoN6c/akR++IyBj3CUzfOKqcbcn7FGvlg
	YOkRyEyckxtAeN0owoTq5ktz3PfM7OTKpV2v+owINpOSsP9fWe9GHhJWkhQnY6mbVEH4PYvuXYtaP
	LzaJjvkA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ljhuT-000qjx-2B; Thu, 20 May 2021 12:36:17 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ljhuP-000qht-Eh
 for ath11k@desiato.infradead.org; Thu, 20 May 2021 12:36:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:MIME-Version:Message-ID:
 In-Reply-To:Date:References:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=TpLmLahd2h7hQJJWsFxm53pPM8fVoixMAUaW1DdjRfU=; b=21seKcGJdVA/pDGwHHIsSTrv74
 mqpnWXx0G2mjtHfjYXpiHUXxLAI/BMO+gtL4JjK5TGSOHhTgwSO1lbXU752Zlit4oB/JW6LYIM8Qp
 E9KGymIpD1PXynazFoKHznif5ftWu1dtqkJfpcWS/nGNFmvcrWfyzg9vOp67+uU7ohnUkVvoLdKog
 yGtx/UuOKExIk3I/1eYydgOgKks6u8/vdx8++JBO6ndydY2IcaDEp7fyWqC2PZVEPPJZpsAaPbG91
 nGm5ZQkF/G8stG8qOSVUEZqG51SvRK7jGAkeQE5TMdQ4GzlkD7vRzppmzRoxR24lvaqBRktfgj1FK
 aaVDYHUA==;
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljhuM-00GKBP-3l
 for ath11k@lists.infradead.org; Thu, 20 May 2021 12:36:12 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1621514169; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=TpLmLahd2h7hQJJWsFxm53pPM8fVoixMAUaW1DdjRfU=;
 b=lJnpaVH2G3YeYRAb7E9b9nOUVNUV7RI0qoKEcjtFuTMPm7yTcjpOQcpa4GcfodFUTC5t3huW
 +dsVTngxOUzULXhZy/UBDZPCFjE2JqqQtdXHlH3CQbX7wxhqNKxhhV0w3pVVuDI37NHywDU0
 /DSnETLa+RH0CfCqphVAWxfyZbA=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 60a657b6d1aee7698da9f574 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 20 May 2021 12:36:06
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id CFD7AC4323A; Thu, 20 May 2021 12:36:05 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id D7A4AC433F1;
 Thu, 20 May 2021 12:36:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D7A4AC433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Greg KH <gregkh@linuxfoundation.org>, Bhaumik Bhatt <bbhatt@codeaurora.org>,
 Loic Poulain <loic.poulain@linaro.org>, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org, regressions@lists.linux.dev,
 stable@vger.kernel.org
Subject: Re: [regressions] ath11k: v5.12.3 mhi regression
References: <87v97dhh2u.fsf@codeaurora.org> <YKYzwBJNTy4Czd1A@kroah.com>
 <20210520104313.GA128703@thinkpad>
Date: Thu, 20 May 2021 15:36:00 +0300
In-Reply-To: <20210520104313.GA128703@thinkpad> (Manivannan Sadhasivam's
 message of "Thu, 20 May 2021 16:13:13 +0530")
Message-ID: <87r1i1h9an.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210520_053610_242263_EFC4BC91 
X-CRM114-Status: GOOD (  20.48  )
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

Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> writes:

> On Thu, May 20, 2021 at 12:02:40PM +0200, Greg KH wrote:
>> On Thu, May 20, 2021 at 12:47:53PM +0300, Kalle Valo wrote:
>> > Hi,
>> > 
>> > I got several reports that this mhi commit broke ath11k in v5.12.3:
>> > 
>> > commit 29b9829718c5e9bd68fc1c652f5e0ba9b9a64fed
>> > Author: Bhaumik Bhatt <bbhatt@codeaurora.org>
>> > Date:   Wed Feb 24 15:23:04 2021 -0800
>> > 
>> >     bus: mhi: core: Process execution environment changes serially
>> >     
>> >     [ Upstream commit ef2126c4e2ea2b92f543fae00a2a0332e4573c48 ]
>> > 
>> > Here are the reports:
>> > 
>> > https://bugzilla.kernel.org/show_bug.cgi?id=213055
>> > 
>> > https://bugzilla.kernel.org/show_bug.cgi?id=212187
>> > 
>> > https://bugs.archlinux.org/task/70849?project=1&string=linux
>> > 
>> > Interestingly v5.13-rc1 seems to work fine, at least for me, though I
>> > have not tested v5.12.3 myself. Can someone revert this commit in the
>> > stable release so that people get their wifi working again, please?
>> 
>> How does the mhi bus code relate to a ath11k driver?  What bus is that
>> on?
>> 
>
> MHI is the transport used by the ath11k driver to work with the WLAN devices
> over PCIe.
>
> Regarding the bug, I'd suggest to wait for Bhaumik (the author of 29b9829718c5)
> to comment on the possible commit which needs backporting from mainline.

Ok, but if a quick fix is not available I think we should just revert
this in the stable releases. I also got a report that v5.11.21 is
broken:

https://bugzilla.kernel.org/show_bug.cgi?id=213055#c11

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
