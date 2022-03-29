Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57874C433EF
	for <ath11k@archiver.kernel.org>; Tue, 29 Mar 2022 23:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LzlA/0jkQlYp3wq26xxtsw8p8dfxTgJVYm2PzKhv9+0=; b=VmEoINA6i0p9Pa
	Ow2ZB0Z5v8+5s9ZIqUU8UZb/scXYQqRcmxMIDwAL5TyRhzLoYJ9riszOVNzg31jblEpuSsyCJERLm
	J4nQMQ8Qvj1pOVNPIUsLLUqEMoFuE1ajyvrAo3/u8rr9B7O9PPIxvVyvQ+0lAe/HQcF0/24PUEYBS
	pPfsfiUtuS6GGK+05aDepOoP0Dt+rJFE9L+aRBJyrZnyLU94PznzIPTHGCppsu1Tny6mBY/yj2UjJ
	7Q8/5RwDcCH6faTz6OtM1JDirJ4jVaQoErYgBjQw3yNI4ia9CN4BZOI21BUelct/iCCOpgg+bdmWz
	KHmldO5GV9mmILNtj82A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZLPO-00Dl3A-RX; Tue, 29 Mar 2022 23:37:54 +0000
Received: from mail-oi1-f181.google.com ([209.85.167.181])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZLPM-00Dl2e-Tz
 for ath11k@lists.infradead.org; Tue, 29 Mar 2022 23:37:54 +0000
Received: by mail-oi1-f181.google.com with SMTP id j83so20562105oih.6
 for <ath11k@lists.infradead.org>; Tue, 29 Mar 2022 16:37:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ZnlJJv2mTkW/GkybuP2Nvc5uQuWnGuRflKAeN/D9Jzo=;
 b=4bGZuI/rqzZ6tVJZyIUYE4dlkPOpbW8XL4EEBVSt1Ab7VydIjIc4w0k77S6xJhk9H9
 10RPLyTLArODPLvDYxLcJlvvyWCCnLZxfMX+xkK0wIGF+TZiYV97R/Qn42h27kmOuy/k
 CZWoX6WG/nPfNykfXvLpfGZxHSUoQOSfXrkdklDfezEFsRi6WxdEMS2Iu8sTefzjND3u
 5rsBWQk2y4czTCrWmL2AMFDFu+IqB0ynsXZUlN9/jmX3mNrCLFbyLQOdl2OLbnKgT5Fz
 UybAcXzeQKMpZj1Ap4sYoxhTfxauPOCQcF6kdfy5y/ZcHxKLwlqzzjmURVRxINS0z1N0
 FSAw==
X-Gm-Message-State: AOAM5328gToz2fk/k0brRxEtqWMbQVdAfG7CILBaSwo7dlyxHJ31o6Gn
 b9B/0S6tODv9q+x+F4FgoN/kC4yhLA==
X-Google-Smtp-Source: ABdhPJx2l0ZTgCmk04heyRtS3320sByNAy4I0VQIQZ3u3VZYVNJBCe43kHlXeU8pdRft7J9JBcMajA==
X-Received: by 2002:a05:6808:302a:b0:2f7:6aa3:63b8 with SMTP id
 ay42-20020a056808302a00b002f76aa363b8mr714253oib.31.1648597071989; 
 Tue, 29 Mar 2022 16:37:51 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 c12-20020a9d75cc000000b005b24b061940sm9533498otl.33.2022.03.29.16.37.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Mar 2022 16:37:51 -0700 (PDT)
Received: (nullmailer pid 1572238 invoked by uid 1000);
 Tue, 29 Mar 2022 23:37:50 -0000
Date: Tue, 29 Mar 2022 18:37:50 -0500
From: Rob Herring <robh@kernel.org>
To: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH v3 01/12] dt: bindings: net: add bindings of WCN6750 for
 ath11k
Message-ID: <YkOYTpTMXTEx5mAU@robh.at.kernel.org>
References: <20220328094838.14093-1-quic_mpubbise@quicinc.com>
 <20220328094838.14093-2-quic_mpubbise@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220328094838.14093-2-quic_mpubbise@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220329_163752_989367_2FC9994F 
X-CRM114-Status: GOOD (  14.99  )
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

On Mon, 28 Mar 2022 15:18:27 +0530, Manikanta Pubbisetty wrote:
> WCN6750 is the WLAN chip on Qualcomm Snapdragon SoC SC7280;
> Though being a PCIe based solution, it is not attached to
> the APSS processor (Application Processor SubSystem), it is
> instead attached to another tiny processor called WPSS Q6
> processor (Wireless Processor SubSystem) on the SC7280 MSM,
> where the WLAN firmware runs, and it is the WLAN firmware
> running on the Q6 processor which enumerates WCN6750, as a
> result APPS processor would never know such a device being
> present in the system and would not detect the WCN6750
> hardware unless and otherwise WCN6750 is registered as a
> platform device. This is the reason behind adding WCN6750
> WLAN node in the device tree.
> 
> Add WCN6750 wireless driver support, its based on ath11k driver.
> 
> Signed-off-by: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
> ---
>  .../bindings/net/wireless/qcom,ath11k.yaml    | 361 ++++++++++++------
>  1 file changed, 252 insertions(+), 109 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
