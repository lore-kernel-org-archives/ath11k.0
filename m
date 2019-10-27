Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iOpad-0001CR-5M
 for ath11k@lists.infradead.org; Sun, 27 Oct 2019 20:56:44 +0000
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
 [209.85.160.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0364320873
 for <ath11k@lists.infradead.org>; Sun, 27 Oct 2019 20:56:42 +0000 (UTC)
Received: by mail-qt1-f177.google.com with SMTP id o3so11679238qtj.8
 for <ath11k@lists.infradead.org>; Sun, 27 Oct 2019 13:56:41 -0700 (PDT)
MIME-Version: 1.0
References: <1571565847-10338-1-git-send-email-kvalo@codeaurora.org>
 <1571565847-10338-2-git-send-email-kvalo@codeaurora.org>
 <20191025213028.GA5117@bogus>
 <874kzu9v2g.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <874kzu9v2g.fsf@kamboji.qca.qualcomm.com>
From: Rob Herring <robh@kernel.org>
Date: Sun, 27 Oct 2019 15:56:29 -0500
Message-ID: <CAL_JsqLD5UfSfYtvp62aGJSDC-Cm4ifk_YmNPRNAXQMnJ2CzVA@mail.gmail.com>
Subject: Re: [PATCH v2 01/49] dt: bindings: net: add qcom,ath11k.yaml
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
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: Kalle Valo <kvalo@codeaurora.org>
Cc: devicetree@vger.kernel.org, linux-wireless <linux-wireless@vger.kernel.org>, ath11k@lists.infradead.org

On Sun, Oct 27, 2019 at 8:28 AM Kalle Valo <kvalo@codeaurora.org> wrote:
>
> Rob Herring <robh@kernel.org> writes:
>
> > On Sun, Oct 20, 2019 at 01:03:19PM +0300, Kalle Valo wrote:
> >> ath11k is a driver for Qualcomm IEEE 802.11ax devices. Add a
> >> bindings document for the driver, first documenting IPQ8074 which is the
> >> only device ath11k currently supports.
> >>
> >> Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>
> >> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
> >> ---
> >>  .../bindings/net/wireless/qcom,ath11k.yaml         | 277 +++++++++++++++++++++
> >>  1 file changed, 277 insertions(+)
> >>
> >> diff --git
> >> a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
> >> b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
> >> new file mode 100644
> >> index 000000000000..5d25542f85f8
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
> >> @@ -0,0 +1,277 @@
> >> +# SPDX-License-Identifier: BSD-3-Clause-Clear
> >
> > (GPL-2.0-only OR BSD-2-Clause) please.
>
> I chose BSD-3-Clause-Clear because ath11k uses that license and I would
> prefer to use the same license throughout the driver.

The schema is not the driver.

> Also it's
> categorised as a preferred license:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/LICENSES/preferred

So are the 2 I listed. (GPL-2.0 is the deprecated version of GPL-2.0-only).

> Any specific reason why you want to change the license?

So that we have some sort of consistency between schemas. It's been a
free-for-all for licensing dts files, headers and bindings til now,
and I'm trying to address some of that as we add schema.

Rob

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
