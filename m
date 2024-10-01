Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5964CE7D1F
	for <ath11k@archiver.kernel.org>; Tue,  1 Oct 2024 13:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mUiwpp+YFTN5f/MqmVvzd+8Z7paLmmGrZW7v90xSyFQ=; b=I61MlYOK00vL/zRnzxLz7mg9dW
	jowp2aOVv6AQ7A9WMtJY8RO04pZnU+srCM92yI0eK7gXZJOwJSiA9Qy3k9WR0GsHj+gye+f9YZvni
	M4m+xPvEc5EqdbJXcA0ArbId7AouQ0GaEVwlJHxr4yeqe/uWoKuh5QWWgs9n/1/2lBCJ1pKKZMqiv
	Gt480WdWEWSeLdLUOtYRqpE6aj4Jc8Od/mWdzOFgMnPXtcXHW0Mikhs1hHorkzf0ViTBmGGycnBSy
	1hhKFTImPMOnhgU8rIsRL/c/8WrMfCaLqxcPeCn2FujpsgbYL5cRgeCcddtVgLkSIm6B8DE9jjQDs
	PoZ0Lbcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svcaU-00000002rf0-1iUk;
	Tue, 01 Oct 2024 13:06:46 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svcaR-00000002rdq-2swF
	for ath11k@lists.infradead.org;
	Tue, 01 Oct 2024 13:06:45 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-71979bf5e7aso4016327b3a.1
        for <ath11k@lists.infradead.org>; Tue, 01 Oct 2024 06:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727788002; x=1728392802; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mUiwpp+YFTN5f/MqmVvzd+8Z7paLmmGrZW7v90xSyFQ=;
        b=de8VwzTD4K/JK8VDzhbQ9iyUUcLfXsfzUH8I5PeThiJaSQ2p1O1DjhX6r3jaAlWeEN
         Y83kuWB2ysgmrVdZ9cgr93R+eLUtGxP0hzQmS/IGX7HyGncsiLRIlmoU/8Mci2/4LFD1
         QF8GJkuZ9LFCBPYdEkKVIDa5U6/BfDcqwgkQV37XNJ7+2oASt3PWiCbqo3WcXX7zIz+d
         Vnzeif4z6SeAGGneqWfYQRQWHIUvFwwPxwMsmOFMakNFdmC7iLECMDRfzmZT+19HRrzx
         /kXYhjCR5EsRqGKLqF5qrdu8dAeuMz/0k8IxLDJIg97QAZ9Kzig+np2K+YiAPEYyury/
         wLHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727788002; x=1728392802;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mUiwpp+YFTN5f/MqmVvzd+8Z7paLmmGrZW7v90xSyFQ=;
        b=h3QrSOkjuDaNH0yj9O/AS/C0WFbrY13o02fWhjz5Xp5XlrYoGGRaWpBDUFoFkHc17X
         a/78I5+jxENAme7B4iOT94k3VkOZSrFKJLiDzY4UMkX9+joZX0vLj2hZO6YQbcpQQMTz
         mcvGW4A6XXdzYBUMuufAXvchfpm2FXX6+hU8V9mFnUoe7KcGLEu6yYgll3m8FXGTHrjz
         naNN49WKBMtbxJNAc6CR0VFi2TFdhcQl5/UAetE2vqLMyvA/Z8AbD5rAfGbzRDM2eV9f
         +OM9GZRiyBAB45Ct2pijDFjVVBe5sz0pptJuOu5eFBiD4C6KUAyKsZzlkDVUuDknbutI
         Q4fA==
X-Gm-Message-State: AOJu0Yxv3NM3jOHg6oUfgvJdX4/GSegXuknJ6JIWrDAR3V+AmTJO5HcK
	vSNcAURMUv6hjw3eafTghqe3Vv6SJG8BF59ZFNWG4w5x+3GYwNOfnzGsVA==
X-Google-Smtp-Source: AGHT+IHbXGODWUPOAFbdKrdNOhwteN0tT2k15ZEgihTJakWG+vneSmKLvmdXWEMRBXAnP/ZAq7okSw==
X-Received: by 2002:a05:6a00:4fcb:b0:717:85e2:28fa with SMTP id d2e1a72fcca58-71b25f853bemr15842439b3a.16.1727788001657;
        Tue, 01 Oct 2024 06:06:41 -0700 (PDT)
Received: from [10.100.121.195] ([152.193.78.90])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7e6db294ebdsm8137931a12.19.2024.10.01.06.06.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Oct 2024 06:06:41 -0700 (PDT)
Message-ID: <dfe29bc6-a8e0-4690-9aa2-b38a15ae1297@gmail.com>
Date: Tue, 1 Oct 2024 06:06:38 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ath11k/WCN6855 neighbor report request made immediately after
 connection gets no response (with MFP)
To: Baochen Qiang <quic_bqiang@quicinc.com>,
 "open list:MEDIATEK MT76 WIRELESS LAN DRIVER"
 <linux-wireless@vger.kernel.org>
Cc: "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>
References: <eb41d8ec-c4f1-474e-a938-099f27aa94e3@gmail.com>
 <fd90d471-503b-4f58-ae11-bae2afab08c7@quicinc.com>
 <0d1dab88-66a0-48c1-bdbe-777d07c3132e@gmail.com>
 <70567137-dfb9-4896-9e6c-6c02a97228cb@quicinc.com>
 <15c909da-f01e-43ee-b486-f9b6d5bcc29c@gmail.com>
 <26302980-4cd8-466a-8de1-4be10a42536a@quicinc.com>
 <f65b609c-0813-414b-885d-24257e76e6d0@gmail.com>
 <241fe825-991f-4dca-ad1c-e45f6a524edf@quicinc.com>
Content-Language: en-US
From: James Prestwood <prestwoj@gmail.com>
In-Reply-To: <241fe825-991f-4dca-ad1c-e45f6a524edf@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_060643_780463_0CB34901 
X-CRM114-Status: GOOD (  10.09  )
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


On 9/28/24 7:14 PM, Baochen Qiang wrote:
>
> On 9/27/2024 7:53 PM, James Prestwood wrote:
>> I think what I saw here was because the capture was done through the AP vendor was automatically decrypted or something. The frame was still marked as protected, but I never had to add the PMK to get wireshark to parse it correctly.
> this is exactly what I see. there is no automatic decryption here, it is only because the frame is NOT encrypted, though 'protected' bit set.
>
>> On my home network when I was referring to "always encrypted" it was because the frames always had the CCMP IV and the content of the frame itself was not visibly a neighbor report/request, just a string of hex values. Once I added the PMK and decrypted it wireshark could parse it.
> is this tested still with IWD?
Yes, only with IWD.

