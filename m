Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69238C433EF
	for <ath11k@archiver.kernel.org>; Wed, 24 Nov 2021 02:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5zXfR/XpEiWEhhA1U0fpJOrJlunpjx5QGrRCoZUKlgI=; b=R9eui52uVtt58v
	IJP8CqFAm8rxGQpXfOsskVV48xHw8nbqtt0EkzLTPEA0InnQF1d4HDVr1C4AXxnzixkucVmo5W6cU
	S7HPbJ/NwQoRIo5+FXITsgBeJ5q4epsSjhqvhRCSQDK0XdIR2vnr7+lSWGriG3Fhwk+oXEvsLE6Wc
	RxQfKTdvwKnIIOcfZfJtjG5iDGcjB+3QeLysEzz2XkVO7OFvCuOXpQz6i8BJDvtbMBG+Ff/xjkAge
	I5dhPwMPGR55SUZxUtk/Lwt7Ot2iCi9umzE8MCPsEgmAliTnrYEgaQA8c1XLfOL2qYv7Ea8y8evwM
	HGTR6xJd+NJ/oCiWv++g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpiVS-003qp5-21; Wed, 24 Nov 2021 02:59:34 +0000
Received: from mail-io1-f53.google.com ([209.85.166.53])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpiVO-003qo3-Mw
 for ath11k@lists.infradead.org; Wed, 24 Nov 2021 02:59:32 +0000
Received: by mail-io1-f53.google.com with SMTP id x6so1271957iol.13
 for <ath11k@lists.infradead.org>; Tue, 23 Nov 2021 18:59:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=hUyB8SMEZEe+wyhi5A4ravu9airL4cafjZQp9SXQVNw=;
 b=aD76RvKSuX88s7VEQLs1eNRiyj+zpaT0gLUq7iRDBVDf4kl4WvQpmEAj5Tvnu256xx
 xFLk2KBrNo0DDM2Ttk4LeR84l3THsAOomX+ZGy8aNmDavx+4lzt54a8aNWY+cu/PwT+7
 t4cmSvB9CmI+vVVzWve707c2pRip63YU/dGcyagkicAPt2KRX5Ro4U/wRvxNiVIY8yAy
 F951njIdnbwi8HiGD5z5b/+aMgUsqnsiyUC5fIVOR/g0sU1XIfua8jFztQ0+VFQ1cRwi
 HtQSBwgyT0xFfwXmDq3B8QSnEXZfAU4XJ04BsnYXivIVpAJUN+ONk1uULhHrwMIcf9po
 0Miw==
X-Gm-Message-State: AOAM533S+ntsaAHa6FReomeBnkI5FMEqY+AoUq+K/9SICmFVqtEZA1bb
 6w7oGI5tO9lrik0X3aP4Jw==
X-Google-Smtp-Source: ABdhPJxeQsgBpDAOtsETWCseXbp1sz848Ix20LrL1yEptsj4UjtqyKezE8HZZzhXVSIc9seyIhVb5g==
X-Received: by 2002:a02:8663:: with SMTP id e90mr11391156jai.14.1637722769739; 
 Tue, 23 Nov 2021 18:59:29 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id ay13sm9089587iob.37.2021.11.23.18.59.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 18:59:29 -0800 (PST)
Received: (nullmailer pid 888172 invoked by uid 1000);
 Wed, 24 Nov 2021 02:59:21 -0000
From: Rob Herring <robh@kernel.org>
To: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 devicetree@vger.kernel.org
In-Reply-To: <1637693434-15462-20-git-send-email-quic_mpubbise@quicinc.com>
References: <1637693434-15462-1-git-send-email-quic_mpubbise@quicinc.com>
 <1637693434-15462-20-git-send-email-quic_mpubbise@quicinc.com>
Subject: Re: [PATCH 19/19] dt: bindings: net: add bindings of WCN6750 for
 ath11k
Date: Tue, 23 Nov 2021 19:59:21 -0700
Message-Id: <1637722761.019285.888171.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211123_185930_767189_D49DAB15 
X-CRM114-Status: UNSURE (   9.71  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On Wed, 24 Nov 2021 00:20:34 +0530, Manikanta Pubbisetty wrote:
> Add WCN6750 wireless driver support, its based on ath11k driver.
> 
> Signed-off-by: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
> ---
>  .../bindings/net/wireless/qcom,ath11k.yaml         | 333 ++++++++++++++-------
>  1 file changed, 225 insertions(+), 108 deletions(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml:57:9: [warning] wrong indentation: expected 6 but found 8 (indentation)

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/net/wireless/qcom,ath11k.example.dt.yaml:0:0: /example-1/remoteproc@8a00000: failed to match any schema with compatible: ['qcom,sc7280-wpss-pil']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1558747

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
