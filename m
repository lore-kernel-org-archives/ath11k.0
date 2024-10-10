Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8CB8CF11FA
	for <ath11k@archiver.kernel.org>; Thu, 10 Oct 2024 15:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P72PVJgi4uitEzWkX+CGhxiijiq09qyKhZsAdOcJJtA=; b=UkHlERUduPOvNC0KPVjl1VWPSI
	zzKFVK8UMY5eR3Zvux0L2F5878uV9YqObJHhScSMJTfe4jZrN38vqeZBUFc0YN53TmkdBHhHvHyml
	PNf5HVzWlcFZ1pr2NZBgknsa5mZAu4NK/kBHgTxjhd7lhqNC+bhyTwk0jVrPeJBVdMs+UDpZ8yu6j
	oLLsohb8ObWSHJYJo92HYupOPC2EAhyW0kiYkYQOMpvSyg4WcPySlFeo25OH+gn9mVl0bO40MHNYf
	xrJ1RfGt1seAD9bxUvaPKcKor0YYH7BmdQs1JCxIDzilPTzlAztbPbMUqmuk229XgQ9mCxgq+k1S2
	q02+ol/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syufA-0000000DF5H-1fYI;
	Thu, 10 Oct 2024 15:01:12 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sytWH-0000000CylI-0il5
	for ath11k@lists.infradead.org;
	Thu, 10 Oct 2024 13:47:58 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-53992157528so1052330e87.2
        for <ath11k@lists.infradead.org>; Thu, 10 Oct 2024 06:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728568075; x=1729172875; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=P72PVJgi4uitEzWkX+CGhxiijiq09qyKhZsAdOcJJtA=;
        b=vfLbq97k883eXph7l9qvMH4CfbRTJcSqzya6Q4O361uyiMFK+FDji4ibhYNtF7O5XS
         EId9SpHvfIf7gjG4iPKUh5TUwuENdW3fiGI69vgsQKNKzJdL0f2wwogkTOhNKua/5zrN
         itT6b7yPcNMg1tP8xEpuK1IKigz67Jij4T4S4x5gD7jZMtTiEbBqnwgOOcOuwdlg5XZh
         p/9241QkSTiTmg964JLkT1N7j2UQCAJIIzNM5Nj5tFUfRNFQiDeyKLJR9nuNSmy4pQFk
         F9FhCBSvtq8y6u98cDRABj4VaKm80OiSbD7PmfIKnk3Us6FMEcpLTQyyqQJUAHzBPWwJ
         Ld/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728568075; x=1729172875;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P72PVJgi4uitEzWkX+CGhxiijiq09qyKhZsAdOcJJtA=;
        b=mePQcJHK/ze3TAfqkoyFk5jkBxDW80wcPNk20sfzGXC0npMH2RAn8mMt6vtDzM3wxW
         PYK/z3l/CU/CIWPE0rph1D271fNYnSUdZmkSkTlZfPWzGAXh7yJrrm0fRJQEO0pamoP2
         BIOqa6fTJxqhkoesIX1rZH1siSM3fG+yzGRZnSUlFfyJ47GzrfJ67CQv+4ji6EQH7RXI
         8o5ehQ8nm7ij84sLE/jhxyKrYoNcg46Ui4ndw46mQhdligXUAiOInkDjJgt3P7osxWZm
         77jiORVx/uQ/N4tEbQtq6vSLU6MbDlgJmpMvsYMZxTgnGnMRAjLS0NlDhI8GfGfj0Th7
         G3tg==
X-Forwarded-Encrypted: i=1; AJvYcCV/JnGhilRkrSQBevy8DH+7uB5F1Qd26MCFxRiQnMzzfys5AwssL0BBAZKg4APwEOaJVyhrqec=@lists.infradead.org
X-Gm-Message-State: AOJu0YxZYmw4TEOeK/XfX3afZfmiCovHhUJV78n44lC3jpWaO6VOje/b
	7ARA+hBgVb5vDEudHbbk/T+BoBu4hPQ1Kqnklb0KwncwjmL4eArtoV/lj5/1LeE=
X-Google-Smtp-Source: AGHT+IEjiQ58D2UdYLj6Yl92fdF2u466WimLIPKrNDpd4Kv0zCmXqRdfPWW59v1LOM5jtmbzLl3WsQ==
X-Received: by 2002:a05:6512:23a9:b0:535:6a4d:ed74 with SMTP id 2adb3069b0e04-539c496114amr4079862e87.51.1728568075061;
        Thu, 10 Oct 2024 06:47:55 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539cb9059f1sm255143e87.301.2024.10.10.06.47.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 06:47:53 -0700 (PDT)
Date: Thu, 10 Oct 2024 16:47:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Miaoqing Pan <quic_miaoqing@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org, 
	agross@kernel.org, andersson@kernel.org, linux-kernel@vger.kernel.org, 
	konrad.dybcio@linaro.org, mchehab@kernel.org, quic_vgarodia@quicinc.com, 
	stanimir.k.varbanov@gmail.com, kvalo@kernel.org, quic_jjohnson@quicinc.com, 
	ath11k@lists.infradead.org
Subject: Re: [PATCH v4] arm64: dts: qcom: sa8775p-ride: add WiFi/BT nodes
Message-ID: <asvhh4kzq6s6yz3wrqfmuolcnlonoobogoh45pnq4zdr44lpxs@zgarzpduk2sk>
References: <20241010132902.2882939-1-quic_miaoqing@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241010132902.2882939-1-quic_miaoqing@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_064757_244866_E7B92A3B 
X-CRM114-Status: GOOD (  11.55  )
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

On Thu, Oct 10, 2024 at 09:29:02PM GMT, Miaoqing Pan wrote:
> Add a node for the PMU module of the WCN6855 present on the sa8775p-ride
> board. Assign its LDO power outputs to the existing WiFi/Bluetooth module.
> 
> Signed-off-by: Miaoqing Pan <quic_miaoqing@quicinc.com>
> ---
> v2:
>   - fix wcn6855-pmu compatible to "qcom,wcn6855-pmu".
>   - relocate pcieport0 node in alphabetical order.
> v3:
>   - add 'qcom,ath11k-calibration-variant = "SA8775P"'.
> v4:
>   - update 'ath11k-calibration-variant' to "Ride".

What exactly is Ride? Is there just one Ride board? I thought it's a
board family name.

Also, could you please extend the commit message with messages from the
ath11k driver, showing the chip_id / board_id ?


-- 
With best wishes
Dmitry

