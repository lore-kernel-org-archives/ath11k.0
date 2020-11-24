Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Date: Tue, 24 Nov 2020 09:42:41 +0000
From: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH 7/9] ath11k: make relay callbacks const
Message-ID: <20201124094241.GG31963@infradead.org>
References: <cover.1606153547.git.jani.nikula@intel.com>
 <44e3d65b71025c462948d0c554061dc7b40ab488.1606153547.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <44e3d65b71025c462948d0c554061dc7b40ab488.1606153547.git.jani.nikula@intel.com>
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
To: Jani Nikula <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, ath11k@lists.infradead.org, Kalle Valo <kvalo@codeaurora.org>

On Mon, Nov 23, 2020 at 07:59:27PM +0200, Jani Nikula wrote:
> Now that relay_open() accepts const callbacks, make relay callbacks
> const.

Looks good,

Reviewed-by: Christoph Hellwig <hch@lst.de>

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
