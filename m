Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2BDBE64A8A
	for <ath11k@archiver.kernel.org>; Tue,  3 Dec 2024 13:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I/lL5pAiR2kE/Mua5K3k92X0rB9806Pb8dHr6N7ntE4=; b=pz+Sn170vXl6ke1D9Kr/Xb4cC0
	S7H6cPboN5SDBp1yWR4g853rbz1MToMW5l8a05b+1wAGoJXxGuPCfEmssfxH81mCKnLrdHaW5V8At
	5p7CeRAzgTPTCPLOykgK+sBh/sEeWb0pDSSSJLIlVW0+KVcy5YUEN2Ui5lrLX0bS3I/K5997PmFej
	MhgPQ92cUqmICXFnpyw1snaLIiwbbZYKNYzpZ/czZgFLNpgv9qZ850sbe/gl77sNiReTtI1vZhI4L
	+CbgiIUY3oFUtRQKcW+KQh5ZkXdBx7kqNT7YOH6WAzC8sLZTL3rECPp2ygblCF3t6nfoyNxDpA03u
	oVBeT4NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tISm3-00000009a4g-1uXG;
	Tue, 03 Dec 2024 13:17:07 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tISeC-00000009YTo-148o
	for ath11k@lists.infradead.org;
	Tue, 03 Dec 2024 13:09:01 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2ffbf4580cbso57295091fa.2
        for <ath11k@lists.infradead.org>; Tue, 03 Dec 2024 05:08:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733231338; x=1733836138; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=I/lL5pAiR2kE/Mua5K3k92X0rB9806Pb8dHr6N7ntE4=;
        b=uu3IfAifk3UjfCk6ORGjRmCXMnYpl1rdA/58xuY3Q4F5Azt5Sp4+zLbpMPvN9PHvGK
         kJAqJc3CL1hCFTppdCO49NgSs0G1go/J5Iaddi8e3SKGVOTzS9gtmpqgSd5QN3T2LFDy
         5S5TAn7eFoJiML/6kyti8qAL6O7t97SW7V4MsJJlyrKUblw67WvGQpje+qfMooMVr/Fd
         fW1uCUfQmIK64gM6UhUceTum3fztHYKRaYl8sBSVq37rPpuq5AfyJmG/bbW53bVlMMIm
         9FWRcp1XVISvNbCT3qLsitsmqClVjKlZ5ne/HLI6aU+dqopXUSTmToXGubOehzBKMlLW
         b1pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733231338; x=1733836138;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I/lL5pAiR2kE/Mua5K3k92X0rB9806Pb8dHr6N7ntE4=;
        b=mSWct+VkFobGqSGnTRyQbKPUehOUcJoY6Tee2C3sI3+LOX2MwOL1fR8xakjbMT9069
         tPrQvPuwzwj4iCfs6nRimDIBgEntNvrJVSUSNEKJac6SqG1mWo+zczr/xYW0ER37Ay6Y
         dnAeBd/rNYwVqi8ol4bESeqP97c3Wb/MOWOUAV1Bn3qnuxX3LBb8v/1ljlwUP77OFPGk
         pgYC5Lpq6/V6l0fTGOH8Rbr/PhKOmkQc0PulNugOndkianvTufMXKGXNQq5e3OUcfYO0
         H+AIvGG5Gf9/qGGtJKaj02PsVZfdOa/ZEMsb5M64HKjkQ/p7XrUa8dudhOGfdd7xVvgd
         fOsg==
X-Forwarded-Encrypted: i=1; AJvYcCW4u3qMK+NP+ZV0LMb7B55IW1Ps7ib8Jha3a8cfE64j3ZhItVrwY2aBgG/zw/xTDP/E6sFj2n8=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4xvD0iFK0pZSp3mBSz1Wc+r8tJ5pZdLUUnpW2YjR9LtfHNZZh
	Kw4V50Ktpg4gZBGF3EnmE6fF8UBue1HDb9UBJ4L3hyLvuikv7iyPMC1HAQ39/xAdfQaRkRe7Sb2
	f
X-Gm-Gg: ASbGncseqgymDGrD3enYsPFruQcCloweRMp7LBEk3pGEOODlW2OSkrvLrw2GQilvTau
	uuRt1/wAHumstLtmuhsHhdcguxrH/A0AVOCYiu5aQcYQxkhI6s38DT+Uf2Ge5Rqp7RzjXnWIAfy
	9TOegIYTVOiqHEnDem6SG34tZvqmIQzg+fSSNBsqu1G/oS8unRn2whgl1w6q4dNXyR/Bo/tIQCv
	mEXhIAXf+uJHRrE1A916kK5HMTtWT40yDnpkWQe9OtuXOz2xNS/2CRyM+2BQXpRFwTV7fSMrlja
	/VsQyKp7AFRkU2ENvDJsocuNdgd+wg==
X-Google-Smtp-Source: AGHT+IFThbwM7lX3Y2ipfgIhRvnqePc6hLDMc8QwYoeSkbRqOQTvnGXT+2fwk+HTyaWcY0FW9Hg0Cw==
X-Received: by 2002:a05:651c:503:b0:2ff:c349:8d08 with SMTP id 38308e7fff4ca-30009c73a30mr17954081fa.8.1733231338062;
        Tue, 03 Dec 2024 05:08:58 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3000a3fb991sm1970151fa.70.2024.12.03.05.08.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 05:08:56 -0800 (PST)
Date: Tue, 3 Dec 2024 15:08:53 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: "Yu Zhang(Yuriy)" <quic_yuzha@quicinc.com>
Cc: andersson@kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, agross@kernel.org, 
	ath11k@lists.infradead.org, konradybcio@kernel.org, kvalo@kernel.org, 
	linux-media@vger.kernel.org, mchehab@kernel.org, quic_jjohnson@quicinc.com, 
	quic_miaoqing@quicinc.com, quic_vgarodia@quicinc.com, stanimir.k.varbanov@gmail.com, 
	quic_jiaymao@quicinc.com
Subject: Re: [PATCH v3] arm64: dts: qcom: qcs615: add WiFi/BT nodes
Message-ID: <vpnvycgbjtksjbktiksaltb73w34ogdxt5satz7cpmel63j3mm@aqvih2idpdfw>
References: <20241203060318.1750927-1-quic_yuzha@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241203060318.1750927-1-quic_yuzha@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_050900_298183_B1420A9E 
X-CRM114-Status: GOOD (  12.97  )
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

On Tue, Dec 03, 2024 at 02:03:18PM +0800, Yu Zhang(Yuriy) wrote:
> Add a node for the PMU module of the WCN6855 present on the qcs615
> board. Assign its LDO power outputs to the existing WiFi/BT module.
> 
> This patch depends on below patch series:
> - base
> https://lore.kernel.org/all/20241104-add_initial_support_for_qcs615-v5-0-9dde8d7b80b0@quicinc.com/
> - pmic
> https://lore.kernel.org/all/20241202-adds-spmi-pmic-peripherals-for-qcs615-v6-0-bdd306b4940d@quicinc.com/
> - pci
> https://lore.kernel.org/all/20241122023314.1616353-1-quic_ziyuzhan@quicinc.com/

This doesn't belong to the commit message. The list of dependncies makes
no sense once they land upstream. Please switch to the b4 tool, use b4
prep --edit-cover to list such info (it will be automatically added to a
non-commit part of the email) and b4 prep --edit-deps to list
dependncies in a machine-readable format.

The patch itself looks good to me.

> 
> Signed-off-by: Yu Zhang(Yuriy) <quic_yuzha@quicinc.com>
> 
> 

-- 
With best wishes
Dmitry

