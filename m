Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06E2ECD98FE
	for <ath11k@archiver.kernel.org>; Thu,  5 Sep 2024 18:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:References:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o4KCutAn8pHOhjQZt0UEL9gY+OQJLOU1nwZw/m4eQRE=; b=dROOj09Kf6mV8F6OnRjYVVjia0
	grzzTJQf3234p0/1EncxRusIPRVD9mp8wHaFcRfP87FYcQrOV+CYnvf52/KwioXsMVSn304S8YFgx
	nihF+cH5NkFGNON8mcDKs7dZvNskZkVP3VT7hoBioYdJrEALTZeKEz626Rn2IcXUos7jcKpR9wuvi
	8SI65NcVuXEB7DQXyD0Ofaauh2tsUSw5mejHoHG3Z1xf9DWZ1mLTZPoOzuCGJnssplm1La/SCUvvK
	4JUYWiuogzahgvrP39hXEoSXPNYep1G+6rIaUfgTAZRlxhx8ZjyHiGsYt4YSa1Z2DJdzhoKJWkDcR
	NFomtSTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smHQY-00000009TWR-0Gbv;
	Thu, 05 Sep 2024 18:41:54 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smHQU-00000009TVx-2MAu
	for ath11k@lists.infradead.org;
	Thu, 05 Sep 2024 18:41:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 367C9A44ED0;
	Thu,  5 Sep 2024 18:41:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33397C4CEC3;
	Thu,  5 Sep 2024 18:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725561709;
	bh=o9v6tfiHjwh1ItvVQA7QxJ59GhaJ+30hamTD7fOplT8=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=EV7haNi4o6VN3Sv+POQLZunJzxyqb0jbJNFTM36W6Y027zpPGoXAF74Tj/pdZ0kR8
	 H6DRhMJX7kUcHB0b2JnHENE+lb0elboyCMZkE5//ooqk55pvv3VVjwyLBshyB3Ryo+
	 p/YO0LjM9b9lorsPtZRofCZ4OkdMLCfZ0yvd6W00ufrFC++BMziq9owzSvQdjhSQM8
	 o/0rw9CmrGrHqDMNBTQh+QbJFnSJdiMcojyXIOOaaXjUxGKNR8itL7xgsyrPlzIChe
	 SJDoZu89a4didcjg5QZNqTqLMLa7wn+Xw9SgRFWFSi5nyUREgoCtg7mHb2zJJZ5wig
	 v8pDzyseDzcmw==
From: Kalle Valo <kvalo@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,  Dmitry Baryshkov
 <dbaryshkov@gmail.com>,  Johan Hovold <johan@kernel.org>,  Dmitry
 Baryshkov <dmitry.baryshkov@linaro.org>,  Bjorn Andersson
 <andersson@kernel.org>,  Rob Herring <robh@kernel.org>,  Krzysztof
 Kozlowski <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,
  linux-arm-msm@vger.kernel.org,  devicetree@vger.kernel.org,
  linux-kernel@vger.kernel.org,  Bartosz Golaszewski
 <bartosz.golaszewski@linaro.org>,
    ath11k@lists.infradead.org
Subject: Re: [PATCH v3 1/4] arm64: dts: qcom: sc8280xp-crd: model the PMU of
 the on-board wcn6855
References: <20240905122023.47251-1-brgl@bgdev.pl>
	<20240905122023.47251-2-brgl@bgdev.pl>
	<6vikrqhdnkefzpahhhtz2hpi62jvcwnzclm7touwtnpxdzvgrf@uc7r6a7bbjek>
	<CAMRc=MeijX2by+MS_vq_OVx25JO6z=zNfymta35h11mbm=vmtQ@mail.gmail.com>
	<CALT56yOP+un5nkxuirJVg=gr7fo4Hqjt1ew3z-=F2J_Y_RcTqg@mail.gmail.com>
	<CAMRc=Mci-8R1Oe3Fe+1E+K-7khzwBPgn_8SQSUPXthpE4032Pw@mail.gmail.com>
	<d6d5a943-ab29-4034-b465-b62d9d1efa61@kernel.org>
Date: Thu, 05 Sep 2024 21:41:44 +0300
In-Reply-To: <d6d5a943-ab29-4034-b465-b62d9d1efa61@kernel.org> (Konrad
	Dybcio's message of "Thu, 5 Sep 2024 15:13:45 +0200")
Message-ID: <87v7zagcyf.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240905_114150_692158_21C934BE 
X-CRM114-Status: GOOD (  15.48  )
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

Konrad Dybcio <konradybcio@kernel.org> writes:

> On 5.09.2024 3:00 PM, Bartosz Golaszewski wrote:
>> On Thu, Sep 5, 2024 at 2:56=E2=80=AFPM Dmitry Baryshkov <dbaryshkov@gmai=
l.com> wrote:
>>>
>>>>>
>>>>> As you are going to post another revision, please also add
>>>>>
>>>>> qcom,ath11k-calibration-variant
>>>>>
>>>>
>>>> I had it in earlier revisions. The only one we could add here would be
>>>> the one from X13s as QCom has not yet released the data for the CRD.
>>>> Johan and Konrad were against adding this here if it doesn't refer to
>>>> the correct one so I dropped it.
>>>
>>> As Kalle usually merges data with some delay it's not infrequent to
>>> have DTS which names calibration variant, but board-2.bin doesn't have
>>> corresponding data. The driver safely falls back to the data without
>>> variant if it can find it. Als  usually it's us who supply the
>>> calibration name.
>>>
>>=20
>> Johan, Konrad,
>>=20
>> What do you think? Do we know the exact name and should I add it or
>> should we wait until it's in board-2.bin?
>
> If we can agree on the string identifier with Kalle in advance, we can
> add it even before the boardfile drops

There have not been really any naming rules for the variant string, it
just needs to be unique so that it doesn't conflict with other variant
strings. What have you been thinking?

But please Cc the ath11k list for anything ath11k related, adding it
now.

--=20
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatc=
hes

