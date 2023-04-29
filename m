Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D74AC77B60
	for <ath11k@archiver.kernel.org>; Sat, 29 Apr 2023 21:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:From:MIME-Version:Date:Message-ID:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7uWOf0WbYqvvus89ks4ydq9QPgZfoFHfN358/lcpWWA=; b=0/iYc/iFzTU/1z
	bXPz9goqfRnZv6hudd1JKvM6XIM8D6J7Ryr65WxJzS+FsYAISjRzoQ8BErzTFGzJKS8Uwq8HTK120
	JsrqsZtqoXeS5UspA+rmAbkA85mYCQNKJMxpFbaDc4/9FusXBh1g0F6ROG0qi3V5CoqowwwjRo7kj
	cNYWOjGJYC8j8rbfO4O5laRvLs0sYFzqmpN3R12rYW7uTvKtbVl3X/g23UZokOdHTISLSbwhmyRlV
	3Ye5mgWgOAD8WfAiedi2OwPt+WTPcEtMbgoHCh7CLLvhiabCatr3cnnH6X5r14QrqDdmBqphY8RY0
	8lVd/Sqj0W8zxuInbHqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1psruW-00DB2g-0u;
	Sat, 29 Apr 2023 21:15:16 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1psruT-00DB1t-0a
	for ath11k@lists.infradead.org;
	Sat, 29 Apr 2023 21:15:14 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-50bc075d6b2so511123a12.0
        for <ath11k@lists.infradead.org>; Sat, 29 Apr 2023 14:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682802910; x=1685394910;
        h=content-transfer-encoding:to:subject:from:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=F+FmoMZqz7W3WZiQY76lgGN6Cl/cEC62w50Fo7l8reg=;
        b=I04HYbsv9qKISnaB0zH0Sj0cTxH0U9biCopleAdg0PvedPB5I5s/XVJIDLAGWphM2b
         mfkpnWd70+2OnkD6/kZETpOTDQL4dJH9AM+47KaGNkkWb6tfdmLNIC/G0Nr+yBO90czH
         a+yEr51ak3rDwHu66L0Whgl+6ZI6Wc5Q37/PV8/lihXgzmjyTLy96d3cCvghYBSvXj6m
         XR4O0/HiV0fRMb02vUheqWkId68VaaAjiqqPdeopHxWY/ASUz11THmif5wOKyK7fVH8A
         fjnBy6tmhdzogymDNaziAug8nMTse3iT44nXOZWcdajVHH8YmYZe7VJpKEqnnjb4ehD/
         oRag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682802910; x=1685394910;
        h=content-transfer-encoding:to:subject:from:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F+FmoMZqz7W3WZiQY76lgGN6Cl/cEC62w50Fo7l8reg=;
        b=Qj8BHJODbf72hLXakhdpN2SKNq5qL7/Joh3SyV+qfn0J1YHPH9acVX91xnc16/ATVr
         aFF9L5LVKhRLPtoMY1a06tuTZzk5CgzVVgteOqUfjEv1NUCO6dISJA/DSsE51Exq6n8W
         EmREZ3Y2DuxergXWIpLyduKPHSa9e4SgqiWIclsPEolPeQfOQHQYKVOS1ewhu7yXtXyc
         mUNvVcd6ko+4DRGkBN4ALvEphczM12lXkvAguKbkTs3eYIbjj9rm8lLFjA7F1qFCkOYI
         hLlZAEQLjOlkHWm249oYD2r9iX4rJTTE4tochDdbczBmP9qd540chnCkTzaUHCrrNzkP
         howw==
X-Gm-Message-State: AC+VfDzN5Po44HjzCoQXjkH1OFsYwb0UO8l4XRyX5UNAS0cqgoExFzI4
	yUqDGVExJ3CIXjyE6AV9belwMqxO0Sw=
X-Google-Smtp-Source: ACHHUZ7EA/DYE17F7A+YefaNXCOAlgg6DXg9gZTBI/WfwwuIu1L46zID2LQAjLnl6X1WQ/p7jdrIJw==
X-Received: by 2002:a05:6402:518:b0:500:46f2:e7db with SMTP id m24-20020a056402051800b0050046f2e7dbmr2214842edv.15.1682802910292;
        Sat, 29 Apr 2023 14:15:10 -0700 (PDT)
Received: from [192.168.1.72] (xdsl-31-165-208-238.adslplus.ch. [31.165.208.238])
        by smtp.gmail.com with ESMTPSA id n9-20020aa7db49000000b00506a59795dcsm10588078edt.54.2023.04.29.14.15.09
        for <ath11k@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 29 Apr 2023 14:15:09 -0700 (PDT)
Message-ID: <4fe0fc29-a0ed-7e4d-7b75-20362d8e2cda@gmail.com>
Date: Sat, 29 Apr 2023 23:15:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
From: =?UTF-8?Q?Jakob_Br=c3=a4uchi?= <jbraeuchi@gmail.com>
Subject: How can i disable Wifi 6
To: ath11k@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230429_141513_220957_531C145D 
X-CRM114-Status: UNSURE (   5.04  )
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

Hi

My new notebook has Qualcomm Atheros QCNFA765 wifi-card but it does not 
play well with the router of my internet provider.
In Windows i could force the wifi-card to Wifi 5 mode by setting the 
"wireless mode".
How can i do the same in Linux ? I could not find a description of the 
parameters for ath11k.
I'm using Ubuntu 23.04 and the driver is ath11k_pci.

Thanks for your support
Jakob


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
