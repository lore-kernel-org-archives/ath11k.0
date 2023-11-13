Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7D92C4332F
	for <ath11k@archiver.kernel.org>; Mon, 13 Nov 2023 12:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8nCbGMZ3wCe21jLzO/42nfUOFHVgwqmCIKxkGdiC/z8=; b=pNXGEIXgcPilVU
	ml5UaKkMUOeU2QFC1MIHjdVxxmhJphmyf0l2io4N8m9nP9feBmOQBs7tBSaaQMsIgsAXKZahcxhe1
	88AW+6bz3B2qXz2jBtAR5yXwupWx+uCdYGGWpVAZ1ByN4eEuKujDc/PfvXLEUMX/y06YFsQKMhCgU
	hGZnAlvxZAlnrOtl388u3MssSm2rhULAJBV/Y2tR6mH14yuPvduefcsKHwW2S3561mO4cJB5GBMTA
	mh3lf0yOV5wERwRAObktkkhF8/Rq99Ry29ZRnE5eTG/AF/XCE7W9GBpD9pJtfXj97HCi7HS1P71K2
	/JHSq2lmLx5cSvYOYNXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2VxZ-00Dwx6-1I;
	Mon, 13 Nov 2023 12:22:33 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2VxW-00DwwT-2i
	for ath11k@lists.infradead.org;
	Mon, 13 Nov 2023 12:22:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 48EEBB80DAC;
	Mon, 13 Nov 2023 12:22:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A62CDC433CC;
	Mon, 13 Nov 2023 12:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699878149;
	bh=iK08OXY6dY0EIsJ75ch5uI0DUUXVJGJlTdQYigZ01hg=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=rnhE9NFYihQUPPjLIKRhMijY8KEdLTiK9wYpdCjO141idobis2aZBenTLipsNxyGE
	 9QtX+Nqjj3Wd4MMOSnbB8mjQXgrsMUJJ60RVi7O5djFD/RwHDLahAIDcW75N8nny8b
	 KeZA377P/iXLWbCR+DXc6intGUtUZwlJSNJnA035wN9TTcGQCSn1kYXywL93wql/BD
	 gKFvMsr4fV06yeEpO6B9ld4zlZh7cmdWpP57kNf1mM9gMl8W08gLsInLn3X29Bw+4G
	 2nMidh6Jd0cT+iscjidxdQiMB8oQnwAXkFJml06EsiFAA5s1Nyhk1OcT8o6zLg7c3T
	 ZyaCDE3nDynVQ==
From: Kalle Valo <kvalo@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Luca Weiss <luca.weiss@fairphone.com>,  Konrad Dybcio
 <konrad.dybcio@linaro.org>,  Andy Gross <agross@kernel.org>,  Bjorn
 Andersson <andersson@kernel.org>,  Mathieu Poirier
 <mathieu.poirier@linaro.org>,  Rob Herring <robh+dt@kernel.org>,
  Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,  Conor Dooley
 <conor+dt@kernel.org>,  Manivannan Sadhasivam <mani@kernel.org>,
  cros-qcom-dts-watchers@chromium.org,
  ~postmarketos/upstreaming@lists.sr.ht,  phone-devel@vger.kernel.org,
  Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,  Rob Herring
 <robh@kernel.org>,  Matti =?utf-8?Q?Lehtim=C3=A4ki?=
 <matti.lehtimaki@gmail.com>,
  linux-arm-msm@vger.kernel.org,  linux-remoteproc@vger.kernel.org,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
    ath11k@lists.infradead.org
Subject: Re: [PATCH 9/9] arm64: dts: qcom: qcm6490-fairphone-fp5: Enable WiFi
References: <20231027-sc7280-remoteprocs-v1-0-05ce95d9315a@fairphone.com>
	<20231027-sc7280-remoteprocs-v1-9-05ce95d9315a@fairphone.com>
	<12ea48bd-5022-4820-815a-89ef23ec9385@linaro.org>
	<CWMK0AQRL87L.1F9MIDVQ4J439@fairphone.com>
	<CAA8EJpqCeW8NVcrpwo6JVn0kE2W-QMELB1YH7i7pgOH6qiPbCQ@mail.gmail.com>
Date: Mon, 13 Nov 2023 14:22:22 +0200
In-Reply-To: <CAA8EJpqCeW8NVcrpwo6JVn0kE2W-QMELB1YH7i7pgOH6qiPbCQ@mail.gmail.com>
	(Dmitry Baryshkov's message of "Sat, 4 Nov 2023 15:23:38 +0200")
Message-ID: <87zfzhu9kx.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231113_042231_168621_54C1D9B7 
X-CRM114-Status: GOOD (  29.19  )
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

(adding ath11k list)

Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:

> [Added Kalle to the CC list]
>
> On Tue, 31 Oct 2023 at 12:31, Luca Weiss <luca.weiss@fairphone.com> wrote:
>>
>> On Mon Oct 30, 2023 at 8:26 PM CET, Konrad Dybcio wrote:
>> > On 27.10.2023 16:20, Luca Weiss wrote:
>> > > Now that the WPSS remoteproc is enabled, enable wifi so we can use it.
>> > >
>> > > Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> > > ---
>> > >  arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 4 ++++
>> > >  1 file changed, 4 insertions(+)
>> > >
>> > > diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
>> > > index d65eef30091b..e7e20f73cbe6 100644
>> > > --- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
>> > > +++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
>> > > @@ -713,3 +713,7 @@ &venus {
>> > >     firmware-name = "qcom/qcm6490/fairphone5/venus.mbn";
>> > >     status = "okay";
>> > >  };
>> > > +
>> > > +&wifi {
>> > > +   status = "okay";
>> > qcom,ath11k-calibration-variant?
>>
>> What value would I put there for my device? Based on existing usages
>> (mostly for ath10k) I'd say "Fairphone_5"?
>
> I think this is fine.

From style point of view I would prefer lower case and dashes, for
example "fairphone-5" but I'm just nitpicking, uppercase and underscores
work fine as well.

If you have different SKUs or similar which need different ath11k board
files being more specific like "fairphone-5-eu" and "fairphone-5-us" is
one option. But I'm sure Luca knows best what is needed for Fairphone,
just throwing out ideas here.

>> And you mean I should add this property in dts before even looking into
>> the firmware/calibration side of it?
>
> From my experience some (most?) of the device manufacturers do the
> wrong thing here. They do not program a sensible board_id, leaving it
> as 0xff or some other semi-random value. The calibration variant is
> the only way for the kernel to distinguish between such poor devices.
>
> The kernel will do a smart thing though. If the device-specific
> calibration data is not present, it will try to fall back to the
> generic data.

You are correct, just to be specific it's ath11k which will choose which
board file to use. I recommend always setting
qcom,ath11k-calibration-variant in DTS if you can.

Back in the day I have tried to push for the firmware team to improve
the board file selection but no success. So the only practical solution
we have is qcom,ath11k-calibration-variant in DTS.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
