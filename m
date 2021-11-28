Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A441C433EF
	for <ath11k@archiver.kernel.org>; Sun, 28 Nov 2021 17:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A2Vmpcce6X+0Ncc9/xvmY4nr4316qSLcqRiPVrrdgjI=; b=S5RU3Ex24z0cmB
	YCjTtKO6PWDNzKEPCLMfHK7LMbX9IimqnDqA3G+UWdQEOW8Z4/tFsCcQVveg55DFXE5d+fZU6V/dT
	VcqUWsJN9WzumGtFfEhG07RgbLNmIJ4kqImKt/gyBEC1Qp8SZllTRQYdoZCNJEodXb66Bt/y+mM5f
	l9YWVCs+PjN1zqHe1OQ0SRdC6PIJPNvJJ4Ib2CsrHMKXZhe96LssjpQ1LUoUIM6Y2f1rTuE+QsVas
	pjHjsfAUIss70WN6JR+xnbr+YKzlOEX1ooVMnkFdf1a4QBnoWBUJvG5vYjXQU7+ti+Ns/F55NHKtV
	IJtaoi5ee7VnTYyXpq8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mrO18-00GLFA-7B; Sun, 28 Nov 2021 17:31:10 +0000
Received: from mail-qk1-f179.google.com ([209.85.222.179])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrO15-00GLEA-KK
 for ath11k@lists.infradead.org; Sun, 28 Nov 2021 17:31:08 +0000
Received: by mail-qk1-f179.google.com with SMTP id g28so20290814qkk.9
 for <ath11k@lists.infradead.org>; Sun, 28 Nov 2021 09:31:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=HOZnfEPnttr55dyGpAF+JeLswq5rht0r3DHq2CKTKuk=;
 b=KQlXLeGUxPDbqFBzZrZ7QDD4gf1O0UE/1393OVDXnrMac8D8WJ587iseeuvDGcGlJh
 5k6KSUPMwC41eamyv+CGYP/ZqzXSJyqOv5wLv086XMNgl9pn9gOZoa60jN8oSaM5OXLC
 BsStHx0A4qKkz0kGIC8cHYI/UlCGR6F7lTXw/riBAZt4Y6F3lz0opmz8Jav57O0IS4I2
 CHLtoU6wJPgta3KFpYTjcbbiof4RtkeDI8140OWxmNaExU9UVyM0rSCwBn1om+8JChVT
 nnAKzP6tsHysFhCmk3yvBxyJMst2XFgki0Sg6m3KgvStHrL27vVtP5lNw7KzXWHajk7k
 qQfQ==
X-Gm-Message-State: AOAM531llMeh6z6ccrshRD3WYIVdC8iG1IGBP1SvwcEAmVSpnUIQUaXX
 Hu9lQ/H1zDWSGUFzmFyCHA==
X-Google-Smtp-Source: ABdhPJw2+ifIMe/CTu4PVjr7v5xnwHL3/1YCQErz+a7uZySRa0cZy8m8hz+QmW2K3pxxRGtHLFXxnw==
X-Received: by 2002:a05:620a:1a19:: with SMTP id
 bk25mr33386927qkb.479.1638120666584; 
 Sun, 28 Nov 2021 09:31:06 -0800 (PST)
Received: from robh.at.kernel.org ([2607:fb90:2edc:4e01:e871:814a:5254:ea69])
 by smtp.gmail.com with ESMTPSA id
 a17sm5824475qkp.108.2021.11.28.09.31.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Nov 2021 09:31:05 -0800 (PST)
Received: (nullmailer pid 2774543 invoked by uid 1000);
 Sun, 28 Nov 2021 17:31:03 -0000
Date: Sun, 28 Nov 2021 11:31:03 -0600
From: Rob Herring <robh@kernel.org>
To: Anilkumar Kolli <akolli@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
 ath11k@lists.infradead.org
Subject: Re: [PATCH v6 1/2] dt: bindings: add new DT entry for ath11k PCI
 device support
Message-ID: <YaO81+V2Mt/ImYxO@robh.at.kernel.org>
References: <1637839211-1503-1-git-send-email-akolli@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1637839211-1503-1-git-send-email-akolli@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211128_093107_692674_4556CA38 
X-CRM114-Status: UNSURE (   9.48  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On Thu, 25 Nov 2021 16:50:10 +0530, Anilkumar Kolli wrote:
> Ath11k driver supports PCI devices such as QCN9074/QCA6390.
> Ath11k firmware uses host DDR memory, DT entry is used to
> reserve host DDR memory regions, send these memory base
> addresses using DT entries.
> 
> Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>
> ---
> V4:
>   - Fix dt_binding_check warnings (Rob)
> V2:
>   - Use reserved-memory (Rob)
> 
>  .../bindings/net/wireless/qcom,ath11k.yaml         | 30 ++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
