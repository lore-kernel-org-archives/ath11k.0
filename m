Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 474D6D2E010
	for <ath11k@archiver.kernel.org>; Wed, 23 Oct 2024 04:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8tv0N3Fc5XqhEn7gwpWEswZ0FylErbMJTUaFuwbVCeo=; b=TyHWJQDf+HWy+DpnZwa8qyxzsI
	b9myfnXsuqEbAxEzJoj/rv4J0kr8skcYmnqPwey+Ru0EP8tyM2OnUdQ856tjja9EajCzfL+ltXUv4
	uoDliRzcQX71OHabGhN4vXX+g6RlTQf7jMxMzBuLb7K9k/BuvCRiUeaM+ytlm4FViFwkhoDEbATGC
	YG93OHJ7vJImHE0fz0O69J40zEfOudjLAbNtmMR1BNP3dv/h/gzMH9nTbojE168TA0Fpkq3gVcGAV
	49lDr8dL8wky6/ZcmtFFIXUfCoHsrimz9WyYN0es4DUulRsLOZ6F+pmxkNzpOQPbof5b+gqE0LL8R
	CVo2bdAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3Sor-0000000CtL4-1x7U;
	Wed, 23 Oct 2024 04:18:01 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3SnL-0000000CsyK-0wuE
	for ath11k@lists.infradead.org;
	Wed, 23 Oct 2024 04:16:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3B895A44898;
	Wed, 23 Oct 2024 04:16:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 446EEC4CEEC;
	Wed, 23 Oct 2024 04:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729656986;
	bh=QvJhyhGAH48Vsp5JZ+z8SGfd37iEk/ar0t90u0rj0bE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kGa9Z2sa1F9ww860SLMVAvRZyxIDSvz8D+dpOjQ+Szl7G3O25jDg2quCbHIWKt6AD
	 567Szo5hkm3rQkzKyHxDu1XB+vg/yghA4ilNR/cpvfem1dUyhNTB7U9JVhIcIYx8vs
	 hIs0CwIb/sjJ1VWX+7veFB49a6FxDM0L+QAh88C+rjfGm23Is9moj7QeNAzSJfJf1G
	 bU5DzvPbgHltgjOQ+E1LbhPoliXrN6Gps/eTDayasVXryh5wpw5tps3XRnE+tkCKr9
	 YzEksIWNQAjli5ckKzNH9mXY4xwNRutKNbGFiUCSdg4inwe0CQcfw5v4SxBlwqj9qG
	 bMaFw1zQtdjAg==
From: Bjorn Andersson <andersson@kernel.org>
To: linux-arm-msm@vger.kernel.org,
	linux-media@vger.kernel.org,
	agross@kernel.org,
	Miaoqing Pan <quic_miaoqing@quicinc.com>
Cc: linux-kernel@vger.kernel.org,
	mchehab@kernel.org,
	quic_vgarodia@quicinc.com,
	stanimir.k.varbanov@gmail.com,
	kvalo@kernel.org,
	quic_jjohnson@quicinc.com,
	ath11k@lists.infradead.org,
	dmitry.baryshkov@linaro.org,
	Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH v7] arm64: dts: qcom: sa8775p-ride: add WiFi/BT nodes
Date: Tue, 22 Oct 2024 23:16:02 -0500
Message-ID: <172965696403.224417.11055570024633295493.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241011041939.2916179-1-quic_miaoqing@quicinc.com>
References: <20241011041939.2916179-1-quic_miaoqing@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241022_211627_346685_DA574C6D 
X-CRM114-Status: UNSURE (   6.29  )
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


On Fri, 11 Oct 2024 12:19:39 +0800, Miaoqing Pan wrote:
> Add a node for the PMU module of the WCN6855 present on the sa8775p-ride
> board. Assign its LDO power outputs to the existing WiFi/Bluetooth module.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: sa8775p-ride: add WiFi/BT nodes
      commit: 7b3e9ac60da7db51394889f8bf92d26b57845f4e

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

