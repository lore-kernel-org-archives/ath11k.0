Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0405EC2BD09
	for <ath11k@archiver.kernel.org>; Fri, 12 Jul 2024 13:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:To:From:Date:Message-ID:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/r/lEr/KPyrqgc2X6rDpXQuAMjImUrqyZuQO00caopI=; b=deO9VGrtKMblSj27MxX/CEZgMR
	cXEkHTDHr+1zaZx+kDrpm7PU/VJvTrWGuscddrkjcO9RLp9e5LKmCPDZfE+AHl7utghGZ+moMraGD
	dL8iAgwkNd34/Hom45uC5FqRqx2u6r6H2ul8VRCmkszLuQCCxLiPKj5zvjAfHG7d+Al+3zcIIG+M4
	54idt9io3HmqfAotSdxf+hB/je0hBwzmU2vCEI0opCQUMfZhCqpH67OT6QhR8LhAzeZR/X3BNasz8
	Lpqg7fG1zo11hqD93zKzdGWQfQ5OF0rx01wXyQRxBORgScfKuTliU9ZRN6fuxDBbuBWYaSfuwGvoC
	JaNKIy/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSGja-00000000DzI-1QZ1;
	Fri, 12 Jul 2024 13:54:50 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSGjX-00000000Dxm-0b1d
	for ath11k@lists.infradead.org;
	Fri, 12 Jul 2024 13:54:48 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-a77e5929033so286312466b.0
        for <ath11k@lists.infradead.org>; Fri, 12 Jul 2024 06:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=8devices.com; s=8devices; t=1720792485; x=1721397285; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:to
         :from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/r/lEr/KPyrqgc2X6rDpXQuAMjImUrqyZuQO00caopI=;
        b=M6BCcr7QiCX7Vfur3x9OWDNlmeyMZQ498k7OhpA5hPyuAPF/4bM6EnE5EwDZHvQpuA
         +1BNP8wttjW/rY+bjW69pqRIBpSXTqRY9i8OvS9J/B74DdgU0yrfekGufwtZG9UlHcRE
         Rm/7CHa2kHSi/mSqrtYiI3VNHgp+IWkj/r2gK/uPV12absbWVf0MLxLymbB4/R2+7Ob8
         I4CPO4n1aO5Ch6BWv5UUdckei0uw4eZIMUCCU0h/Ho66yJx7kvaz1XAOZre05+6qNXfA
         qFTw2XzgfFMzqNGom7BiBewljs9BPkEA6EKovB4dMrTmLmwjyho1Qsps3EPrNCCHqLTN
         ztog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720792485; x=1721397285;
        h=in-reply-to:content-disposition:mime-version:references:subject:to
         :from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/r/lEr/KPyrqgc2X6rDpXQuAMjImUrqyZuQO00caopI=;
        b=wHN/dfqNEoTY4RmzBE7X+UGTYrvfekb04fDSHbJLtXiz+C7qWKirtDOoGQR29PiI9I
         vuq071UMlrp8QbCarBL5724ljZ/H7J5oxs94flhqZqEpRP2H+PinHKRMWzMs7Vk/WbA/
         QysmPbqqPLB2DeS+6/ydxr/UZhm/3Hz9ImyalDwMnWlj4SE14V9sf0jj9naGmbLkHGcg
         aPDppWFNC47BXVH3ycgLrFo2k78u/iUMK8LqYmhF9Byz38du0BcRmJ0bCAblo/SSNaAO
         wyrtKuva9Z57krhtA2JQg/PF4KhVW2fkK++yxpPWAhLrOuaRPzJn4cW3lUDs+DcXhk/T
         p2Kw==
X-Gm-Message-State: AOJu0Ywa0MZLGcq0/oahE/pqAFnNu/518sxT+9QdxgGqQEpDlK+UiCcn
	T549P0yLFBh8CgotVW8ptYzPRSxbQL6jbE7727o7ci8vN4vRuqgNB9SMlPckYWlHPh31iy0FKDc
	R
X-Google-Smtp-Source: AGHT+IFU/L5ugLvKOEh1zqVLDr3ukr015zcG+mqSMznXFUzu2NF5EWuRWPewcOVMZfvt9r+Qi/S5Mg==
X-Received: by 2002:a17:906:3693:b0:a77:e140:a66d with SMTP id a640c23a62f3a-a780b89cb1amr724255466b.67.1720792484653;
        Fri, 12 Jul 2024 06:54:44 -0700 (PDT)
Received: from localhost ([84.15.37.222])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a780a8720f9sm346556066b.220.2024.07.12.06.54.44
        for <ath11k@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jul 2024 06:54:44 -0700 (PDT)
Message-ID: <669135a4.170a0220.8fbf0.26d5@mx.google.com>
X-Google-Original-Message-ID: <ZpE1OhY1bcgP3Qzj@DESKTOP-FU19S8J.>
Date: Fri, 12 Jul 2024 16:54:44 +0300
From: Giedrius <giedrius@8devices.com>
To: ath11k@lists.infradead.org
Subject: Re: AW: ath11k monitor mode
References: <FRYP281MB0160287D5A3D8F7130707BDAEB1B2@FRYP281MB0160.DEUP281.PROD.OUTLOOK.COM>
 <43b0cdc0-f489-410a-a702-5a5092b9bc18@quicinc.com>
 <8ab6d337-1c2b-40d8-80a4-2a1ca4092987@quicinc.com>
 <d93be101-4aa4-414c-bb1f-292d3f8fe27c@quicinc.com>
 <FRYP281MB0160C7239CB63E4061D4CDB4EB1A2@FRYP281MB0160.DEUP281.PROD.OUTLOOK.COM>
 <FRYP281MB0160FB54135444832AA77E6AEBC22@FRYP281MB0160.DEUP281.PROD.OUTLOOK.COM>
 <841700e2-fb8b-4700-b794-17ea9abcb011@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <841700e2-fb8b-4700-b794-17ea9abcb011@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240712_065447_233555_4611CCCC 
X-CRM114-Status: UNSURE (   9.13  )
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

On Mon, Jun 17, 2024 at 10:18:14AM +0800, Kang Yang wrote:
> Hi, there is another issue on this monitor mode, so we spent some time on
> it. At present, it seems that two patches are needed to fully fix it.
> 
> I will send them to review group after verification by the testing team.

Are these patches available anywhere?

I would be interested in testing them out, even if unverified. 
Currently, any significant WiFi traffic is causing RCU stall on monitor interface.

Thank you,
Giedrius

