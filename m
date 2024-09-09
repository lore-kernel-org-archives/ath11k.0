Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8208EECE579
	for <ath11k@archiver.kernel.org>; Mon,  9 Sep 2024 12:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:References:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fizaTSEXyuljg6z99BiS3/Mrs+MIVr7UUib2+wXCqrI=; b=dd98fsl/n77QuJIlWzgxN0g/bW
	ZgGGb7tMhPHl5A3xVO1m2i/yLI0GaLbYcBP8j9kk0Jg612IJvljxamj1J/kBm4+sbNvSl+ybGaASa
	DqNZaDVwAfAJWaC9JfQiIHNUCHnSlNXJ54OgJ6Y9DKE/oLiQ9yTqE8TszxSG+m4pKDQO8l0GvOReE
	mv07EkZLjqWIlPr/nnIT62HTYO1a/GlnPO5YE5xBIBNmGNMLjrgcW2Qffb+dYi9O+MydP0fQarmN4
	23dp9cs16xf240I3dHY/kUha+Lq4nAwCcWrpMTVug5rpIaHaxpkbCVjluZFpUoblKjgJz9QYB0SWq
	G6J2wIPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sndni-00000001uQp-317U;
	Mon, 09 Sep 2024 12:47:26 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sncQC-00000001da0-3buz
	for ath11k@lists.infradead.org;
	Mon, 09 Sep 2024 11:19:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id ADB8F5C578D;
	Mon,  9 Sep 2024 11:19:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01F4BC4CEC5;
	Mon,  9 Sep 2024 11:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725880743;
	bh=fizaTSEXyuljg6z99BiS3/Mrs+MIVr7UUib2+wXCqrI=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=llMRU4jBH0AM1JdyNXEFRiRfhyjHedUj/nkSh699MZuJ3A/blM8Vsm2qf3DZrzIz+
	 OHQJUh+l9E798zfPbXgRbT5koeL5Z0FEVfUk41otCyKI4nWEKNkyPabVpcCgohK2nq
	 6rMBtYFYAr/l/EK/sJglmJssL8J2gQQwPJEDSoAt0Bh/5NZMND4GdtJQchi/Ue9TxE
	 J5xy5q7X5FJ0aS+FqUxXpAgurHlYYiRUE944dR+SVE+3pMBsWmttqnkFVGY0pxPW+W
	 aErRF1PNM2HhvRHA6jNcW00VCmAE8+I8ghfIL8NOUMYrFhpuPRNIbvp+86C3lkhVAA
	 rSnG1DcI3vWQg==
From: Kalle Valo <kvalo@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,  Konrad Dybcio
 <konradybcio@kernel.org>,  Dmitry Baryshkov <dbaryshkov@gmail.com>,  Johan
 Hovold <johan@kernel.org>,  Bjorn Andersson <andersson@kernel.org>,  Rob
 Herring <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>,  linux-arm-msm@vger.kernel.org,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,  Bartosz
 Golaszewski <bartosz.golaszewski@linaro.org>,  ath11k@lists.infradead.org
Subject: Re: [PATCH v3 1/4] arm64: dts: qcom: sc8280xp-crd: model the PMU of
 the on-board wcn6855
References: <20240905122023.47251-1-brgl@bgdev.pl>
	<20240905122023.47251-2-brgl@bgdev.pl>
	<6vikrqhdnkefzpahhhtz2hpi62jvcwnzclm7touwtnpxdzvgrf@uc7r6a7bbjek>
	<CAMRc=MeijX2by+MS_vq_OVx25JO6z=zNfymta35h11mbm=vmtQ@mail.gmail.com>
	<CALT56yOP+un5nkxuirJVg=gr7fo4Hqjt1ew3z-=F2J_Y_RcTqg@mail.gmail.com>
	<CAMRc=Mci-8R1Oe3Fe+1E+K-7khzwBPgn_8SQSUPXthpE4032Pw@mail.gmail.com>
	<d6d5a943-ab29-4034-b465-b62d9d1efa61@kernel.org>
	<87v7zagcyf.fsf@kernel.org>
	<ywn7bq6j6jgokwmm3vsumkuwijplezmery5tr6z5yeblnpyjh7@djkwdbt4sl3q>
	<CAMRc=Mfj3gpgV0N__oB8kF5pk4PrDwP1CqeUgUbvTwyo7p=7bQ@mail.gmail.com>
	<CAA8EJppi5Zy82=ZUZ67DW-40Qm7aMerNLu_Mzh3HiUBWqPiHVw@mail.gmail.com>
	<CAMRc=Mf--M9d-awzQcs=W8frBwNfkjyvyCrmHAc3MofQo-qp1Q@mail.gmail.com>
Date: Mon, 09 Sep 2024 14:18:58 +0300
In-Reply-To: <CAMRc=Mf--M9d-awzQcs=W8frBwNfkjyvyCrmHAc3MofQo-qp1Q@mail.gmail.com>
	(Bartosz Golaszewski's message of "Fri, 6 Sep 2024 11:45:39 +0200")
Message-ID: <875xr5gjml.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_041904_968361_DC6DAB4E 
X-CRM114-Status: GOOD (  13.98  )
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

Bartosz Golaszewski <brgl@bgdev.pl> writes:

> On Fri, Sep 6, 2024 at 11:37=E2=80=AFAM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
>
>>
>> On Fri, 6 Sept 2024 at 10:45, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>> >
>> > On Thu, Sep 5, 2024 at 9:26=E2=80=AFPM Dmitry Baryshkov
>> > <dmitry.baryshkov@linaro.org> wrote:
>> > >
>> > > QC_8380_CRD (following DMI / Windows name) or QC_X1E80100_CRD (follo=
wing
>> > > marketing name). Or maybe QTI_ instead of QC_. WDYT?
>> > >
>> >
>> > Is there any central authority listing these names? Or are they just
>> > agreed upon on the mailing list? I honestly don't know where they come
>> > from.
>>
>> I think on ath12k these names come from ACPI tables. On all previous
>> devices it is just being agreed upon. Kalle is the central authority.
>>
>
> Kalle: is "QC_8280XP_CRD" fine for you for a board called sc8280xp-crd?

Yes.

--=20
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatc=
hes

